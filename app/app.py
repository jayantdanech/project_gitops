from flask import Flask, render_template
import os

app = Flask(__name__)

@app.route('/')
def home():
    environment = os.getenv("APP_ENV", "development").capitalize()
    version = os.getenv("APP_VERSION", "v1.0")
    return render_template('index.html', environment=environment, version=version)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

