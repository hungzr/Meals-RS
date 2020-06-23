# def cal_ap(recoms, num_actual_add):
#     '''
#     Calculate AP by calculating Precision and Recall

#     :param recoms: Array of binary [1,0,0] with 1 is True
#     :param num_actual_add: number of labels

#     :return: result of AP
#     '''

#     precs = []
#     recalls = []

#     for indx, rec in enumerate(recoms):
#         precs.append(sum(recoms[:indx+1])/(indx+1))
#         recalls.append(sum(recoms[:indx+1])/num_actual_add)
#     ap = (1/num_actual_add) * (sum(precs[i]*recoms[i] for i in range(len(recoms))))

#     print('Precision final: ',precs)
# #     print('Recall final: ', recalls)
# #     print('AP final: ', ap)
    
# #     return ap
# # # cal_ap([1,1,1], 3)

# # menu_array = [['bún sứa', 'nước ép lê'], ['bánh pizza nấm', 'sữa tươi']]
# # menu_array = [', '.join(recipe for recipe in menu).capitalize() for menu in menu_array]
# # print(menu_array)

#coding: utf-8
from bottle import route, error, post, get, run, static_file, abort, redirect, response, request, template

@route('/')
@route('/index.html')
def index():
    return '<a href="/hello">Go to Hello World page</a>'

@route('/hello')
def hello():
    return '<h1>HELLO WOLRD</h1>'

@route('/hello/:name')
def hello_name(name):
    page = request.GET.get('page', '1')
    return '<h1>HELLO %s <br/>(%s)</h1>' % (name, page)

@route('/static/:filename')
def serve_static(filename):
    return static_file(filename, root='/home/arthur/workspace/my_python_codes/src/')

@route('/raise_error')
def raise_error():
    abort(404, "error...")

@route('/redirect')
def redirect_to_hello():
    redirect('/hello')

@route('/ajax')
def ajax_response():
    return {'dictionary': 'you will see ajax response right? Content-Type will be "application/json"'}

@error(404)
def error404(error):
    return '404 error !!!!!'

@get('/upload')
def upload_view():
    return """
        <form action="/upload" method="post" enctype="multipart/form-data">
          <input type="text" name="name" />
          <input type="file" name="data" />
          <input type="submit" name="submit" value="upload now" />
        </form>
        """    

@post('/upload')
def do_upload():
    name = request.forms.get('name')
    data = request.files.get('data')
    if name is not None and data is not None:
        raw = data.file.read() # small files =.=
        filename = data.filename
        return "Hello %s! You uploaded %s (%d bytes)." % (name, filename, len(raw))
    return "You missed a field."

@route('/tpl')
def tpl():
    return template('test')

run(host='localhost', port=8085, reloader=True)

