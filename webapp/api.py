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
@api.route('/search?field=[athletes,teams,year]&keyword={search_text}')
def get_search_results():
    ''' returns a list of race results by athlete, team, or year
    '''
    query = '''[insert SQL here]'''

    field_argument = flask.request.args.get('field')
    if sort_argument == 'athletes':
        query += ''
    elif sort_argument == 'teams':
        query += ''
    elif sort_argument == 'year':
        query += ''

    #will also have to query for keyword

    results_list = []
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, tuple())
        for row in cursor:
            author = {'id':row[0],
                      'first_name':row[1], 'last_name':row[2],
                      'birth_year':row[3], 'death_year':row[4]}
            author_list.append(author)
        cursor.close()
        connection.close()
    except Exception as e:
        print(e, file=sys.stderr)

    return json.dumps(author_list)

