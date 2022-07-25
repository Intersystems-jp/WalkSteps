import base64
from io import BytesIO
import matplotlib.pyplot as plt

from flask import Flask, render_template, request
import global_goiris as goiris

app = Flask(__name__)

@app.route('/',methods=['GET','POST'])
def index():
    #月取得（グローバル編）
    monthlist=goiris.getMonthGlo()
    if request.method=='GET':
        defaultmonth=7
    else:
        result=request.form
        defaultmonth=result['selectmonth']

    #print(defaultmonth)
    #データ取得（グローバル編）
    result=goiris.createChartFromGlo(defaultmonth)

    rdate=result[0]
    steps=result[1]

    #参考にしたページ：https://shiren-blog.com/flask-matplotlib-graph-demo/
    #グラフ作成
    fig = plt.figure(figsize=(10, 5))
    ax = fig.add_subplot(111)

    if defaultmonth=="5":
        color="green"
    elif defaultmonth=="6":
        color="orange"
    else:
        color="blue"
    
    ax.plot(rdate, steps, label="test",marker="o",color=color,linestyle="-.")
    #バッファに保存
    buf=BytesIO()
    fig.savefig(buf,format='png')
    #グラフをHTMLに埋め込むように変換
    data=base64.b64encode(buf.getbuffer()).decode('ascii')
    image_tag = f'<img src="data:image/png;base64,{data}"/>'
    return render_template("index.html",image=image_tag,monthlist=monthlist,selectmonth=defaultmonth)


if __name__=="__main__":
    #app.run(debug=True,host='0,0,0,0',port="8081")
    app.run(debug=True,host='0.0.0.0')
