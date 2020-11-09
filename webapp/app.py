'''
    example template
    Jeff Ondich, 25 April 2016
    Updated 4 November 2020

    A tiny Flask application that provides a website with an accompanying
    API (which is also tiny) to support that website.

    Your website and API will be more complex.
'''
import sys
import flask
import api

########### Initializing Flask ###########
# Note that this stuff has to be up here at the top, because otherwise
# the @app.route lines would raise a "name not defined" exception.
app = flask.Flask(__name__, static_folder='static', template_folder='templates')
app.register_blueprint(books_api.api, url_prefix='/api')


########### The website routes ###########
# (As you can see, there's not much of a website in this example.)
@app.route('/')
def get_main_page():
    ''' This is the only route intended for human users '''
    return flask.render_template('index.html')

@app.route('/search?field=[athletes,teams,year]&keyword={search_text}')
def get_search_page():
    return flask.render_template('search.html')

# everything below this could be wrong
@app.route('/team_performance?teams={team_codes}')
def get_team_performance():
    pass

@app.route('/team_depth?teams={team_codes}&years={years}')
def get_team_depth():
    pass

@app.route('/athlete_development?sort_by=[place, time]&teams={team_codes}')
def get_athlete_development():
    pass

########### Running the website server ###########
if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('Usage: {0} host port'.format(sys.argv[0]), file=sys.stderr)
        exit()

    host = sys.argv[1]
    port = int(sys.argv[2])
    app.run(host=host, port=port, debug=True)
