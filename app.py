from flask import Flask

app = Flask(__name__)


@app.route('/new', methods=['GET', 'POST'])
def new():
    return 'Cadastre algo'


@app.route('/<short>')
def home(short):
    return "Olá, Mundo!"


@app.errorhandler(404)
def page_not_found(e):
    toPage = {
        'title': 'Erro 404',
        'site': SITE,
        'css': '404.css'
    }
    return 'erro 404'


if __name__ == '__main__':
    app.run(debug=True)
