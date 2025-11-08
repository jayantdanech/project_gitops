from flask import Flask, render_template
import os
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def home():
    environment = os.getenv("APP_ENV", "development").capitalize()
    version = os.getenv("APP_VERSION", "v1.0")
    date_time = os.get
    formatted_date_time = current_datetime.strftime("%A, %B %d, %Y at %H:%M:%S")

    return render_template('index.html', environment=environment, version=version, server_datetime=formatted_date_time)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

