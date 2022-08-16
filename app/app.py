from flask import Flask

import datetime
import json
from pytz import timezone

app = Flask(__name__)


def get_local_datetime(tz: str) -> datetime:
    return datetime.datetime.now(timezone(tz))


@app.route('/', methods=['GET'])
def index() -> str:
    tzs = {
        "Berlin": "Europe/Berlin",
        "Tokyo": "Asia/Tokyo",
        "New York City": "US/Eastern"
    }
    result = ""

    for city, tz in tzs.items():
        result += f"<p>{city}: {get_local_datetime(tz).strftime('%H:%M:%S')}</p>"
    return result


@app.route('/health', methods=['GET'])
def health():
    return json.dumps({"healthy": "OK", "statusCode": 200})


if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8080)
