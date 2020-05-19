from flask import Flask,render_template,request,json,abort,jsonify

app = Flask(__name__)

with open('students.json') as json_file:
    students = json.load(json_file)

@app.route('/alumnos' , methods=['GET'])
def get_students():
    return jsonify(students)

app.config["DEBUGG"] = True
app.config['JSON_SORT_KEYS'] = False
app.run(host='0.0.0.0')