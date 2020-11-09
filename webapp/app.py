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
app = flask.Flask(__name__, static_folder='static', template_folder='templates')
app.register_blueprint(books_api.api, url_prefix='/api')


########### The website routes ###########
# (As you can see, there's not much of a website in this example.)
@app.route('/')
def get_main_page():
    ''' This is the only route intended for human users '''
    return flask.render_template('index.html')

@app.route('/<path:path>')
def shared_header_catchall(path):
    return flask.render_template(path)

########### Running the website server ###########
if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('Usage: {0} host port'.format(sys.argv[0]), file=sys.stderr)
        exit()

    host = sys.argv[1]
    port = int(sys.argv[2])
    app.run(host=host, port=port, debug=True)
