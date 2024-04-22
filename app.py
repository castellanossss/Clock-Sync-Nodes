from flask import Flask, render_template
from flask_socketio import SocketIO
import datetime, threading

app = Flask(__name__)
socketio = SocketIO(app)

simulated_time = datetime.datetime.strptime('10:00:00 AM', '%I:%M:%S %p')

def increment_time():
    global simulated_time
    while True:
        simulated_time += datetime.timedelta(seconds=1)
        socketio.sleep(1)  

threading.Thread(target=increment_time, daemon=True).start()

@app.route('/')
def index():
    return render_template('index.html', time=simulated_time.strftime('%I:%M:%S %p'))

if __name__ == '__main__':
    socketio.run(app, debug=True, host='0.0.0.0')

