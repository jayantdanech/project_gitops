from flask import Flask, render_template
import os
from datetime import datetime

app = Flask(__name__)

# Static at app start
BUILD_TIME = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

@app.route('/')
def home():
    environment = os.getenv("APP_ENV", "development").capitalize()
    version = os.getenv("APP_VERSION", "v1.0")
    return render_template(
        'index.html',
        environment=environment,
        version=version,
        build_time=BUILD_TIME
    )

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

