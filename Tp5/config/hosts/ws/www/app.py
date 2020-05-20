from flask import Flask,render_template,request,json,abort,jsonify

app = Flask(__name__)

students = [
{
    "Id":0,
    "Nombre":"Marcos",
    "Matricula":12345678
},
{
    "Id":1,
    "Nombre":"Sofia",
    "Matricula": 87654321
},
{
    "Id":2,
    "Nombre":"Nicolas",
    "Matricula": 83654321
}
]

id = len(students)


@app.route('/alumnos' , methods=['GET'])
def get_students():
    return jsonify(students)

@app.route('/alumnos' , methods=['POST'])
def add_student():
    json_in = request.json

    if not json_in:
        abort(404)

    if 'Nombre' in json_in and 'Matricula' in json_in :
        for student in students:
            if student['Matricula'] == json_in['Matricula'] :
                return "Error: Existent Student"

        global id
        id += 1
        json_in['Id'] = id
        students.append(json_in)
        return "Success : Student Added"

    else:
        return 'Error : Invalid Student Entry '

@app.route('/alumnos/id' , methods=['DELETE'])
def del_student():

    json_in = request.json
    if 'Id' in json_in :

        Id = int (json_in['Id'])

        if Id in students:
            return "Existent Id"

        for student in students:
            if student['Id'] == Id :
                students.remove(student)
                return "Success : Student Deleted"
        return "Error : Student Id not Existent"

    else:
        return "Error : No Id specified"

app.run(host='0.0.0.0',port='60000',debug=True)