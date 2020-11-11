'''
    books example template
    Jeff Ondich, 25 April 2016
    Updated 4 November 2020

    Tiny Flask API to support the tiny books web application.
'''
import sys
import flask
import json
import config
import psycopg2

########### Initializing Flask ###########
# We're using a Flask "Blueprint" to enable us to put the website pages
# in the main Flask application (in books_webapp.py) and the API over
# here. Since the website and the API are conceptually separate, I like
# to keep them in separate files. This gets more worthwhile as the
# application grows.
api = flask.Blueprint('api', __name__)


########### Utility functions ###########
def get_connection():
    ''' Returns a connection to the database described in the
        config module. May raise an exception as described in the
        documentation for psycopg2.connect. '''
    return psycopg2.connect(database=config.database,
                            user=config.user,
                            password=config.password)

########### The API endpoints ###########

@api.route('/search')
def get_search_results():
    ''' returns a list of race results by athlete, team, or year
    '''
    field = flask.request.args.get('field')
    keyword = flask.request.args.get('keyword')
    if field == 'athletes':
        results = search_athletes(keyword)
    elif field == 'teams':
        results = search_teams(keyword)
    elif field == 'year':
        results = search_years(keyword)
    return json.dumps(results)

def get_cursor(query):
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, tuple())
        #close connection
    except Exception as e:
        print(e, file=sys.stderr)
    return cursor

def search_athletes(keyword):
    query = 'SELECT athletes.name, place, time, teams.name, year FROM athletes, teams, individual_performances WHERE ath_id = athletes.id AND team_id=teams.id AND meet_id=meets.id AND athletes.name LIKE ' + '%' + keyword + '%;'
    cursor = get_cursor(query)
    athletes_list = []
    for row in cursor:
        athlete = {'name': row[0], 'team': row[3], 'place': row[1], 'time': row[2], 'year': row[4]}
        athletes_list.append(athlete)
    cursor.close()
    return athletes_list

def search_teams(keyword):
    query = 'SELECT teams.name, place, points, year, team.location FROM teams, meets, team_performances WHERE team_id=teams.id AND meet_id=meets.id AND teams.name = ' + '%' + keyword + '%;'
    teams_list = []
    for row in cursor:
        team = {'name': row[0], 'location': row[4], 'place': row[1], 'points': row[2], 'year': row[3]}
        teams_list.append(team)
    cursor.close()
    return teams_list

def search_years(keyword):
    teams_query = 'SELECT teams.name, place, points, meets.location FROM teams, meets, team_performances WHERE meet_id = meets.id AND team_id = teams.id AND year = ' + keyword + 'ORDER BY place;'
    individuals_query = 'SELECT athletes.name, place, time, teams.name FROM athletes, individual_performances, teams, meets WHERE meet_id = meets.id AND team_id = teams.id AND ath_id = athletes.id AND year = ' + keyword + 'ORDER BY place;'
    teams_cursor, individuals_cursor = get_cursor(teams_query), get_cursor(individuals_query)
    teams_list, individuals_list = [], []
    for row in teams_cursor:
        team = {'name': row[0], 'place': row[1], 'points': row[2], 'location': row[3]}
        teams_list.append(team)
    for row in individuals_cursor:
        individual = {'name': row[0], 'team': row[3], 'place': row[1], 'time': row[2]}
        individuals_list.append(individual)
    teams_cursor.close()
    individuals_cursor.close()
    return [teams_list, individuals_list]
