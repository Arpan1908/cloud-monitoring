import psutil
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    cpu = psutil.cpu_percent()
    mem = psutil.virtual_memory().percent
    Message = None
    if cpu > 80 or mem > 80:
        Message = "Alert! CPU or Memory usage is above 80%"
    return render_template("index.html", cpu_metric=cpu, mem_metric=mem, message=Message)


if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')