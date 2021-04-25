<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="leo.20210425195349.1"><vh>@settings</vh>
<v t="leo.20210425195349.2"><vh>@data qt-gui-plugin-style-sheet</vh></v>
<v t="leo.20210425195349.3"><vh>@string initial_split_orientation = horizontal</vh></v>
</v>
<v t="leo.20210425195337.1"><vh>About nfumde</vh>
<v t="leo.20210425201313.1"><vh>local program</vh>
<v t="leo.20210425201616.1"><vh>newHeadline</vh></v>
</v>
</v>
<v t="leo.20210425195403.1"><vh>import source code</vh>
<v t="leo.20210425195403.2"><vh>recursive importer</vh></v>
</v>
<v t="leo.20210425195432.1"><vh>imported files</vh>
<v t="leo.20210425195432.2"><vh>@path ./</vh>
<v t="leo.20210425195432.3"><vh>@clean wsgi.py</vh>
<v t="leo.20210425195432.4"><vh>Declarations</vh></v>
<v t="leo.20210425195432.5"><vh>timeTableList</vh></v>
<v t="leo.20210425195432.6"><vh>timeTable</vh></v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="leo.20210425195337.1">2021.04.25 

假如要將各實驗室查詢的排課時間表存入資料庫, 則必須在解讀 table 資料時, 同時取得排課的時段</t>
<t tx="leo.20210425195349.1"></t>
<t tx="leo.20210425195349.2">QTreeWidget {
    /* These apply to the selected item, but not to editing items.*/
    background-color: #ffffec; /* Leo's traditional tree color */
    selection-color: black; /* was white */
    selection-background-color: lightgrey;
    /* font-family: SansSerif; */
    /*font-family: DejaVu Sans Mono;*/
    font-family:YaHei Mono;
    /* 標題字型大小設定 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
 }

/* Headline edit widgets */
QTreeWidget QLineEdit {
    background-color: cornsilk;
    selection-color: white;
    selection-background-color: blue;
    /*font-family: DejaVu Sans Mono;*/    
    font-family:YaHei Mono;
    /* 沒有特別對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The log panes */
QTextEdit {
    background-color: #f2fdff;
    selection-color: red;
    selection-background-color: blue;
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* log font 大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The body pane */
QTextEdit#richTextEdit {
    background-color: #fdf5f5; /* A kind of pink. */
    selection-color: white;
    selection-background-color: red;
    /*font-family: DejaVu Sans Mono;*/
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* 內文字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

QLabel {
    font-family:YaHei Mono;'CherryPy', 'pytz', 'mako', 'beautifulsoup4', 'pymysql', 'peewee'
    /* 下方的 Minibuffer 標題字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

/* Editor labels */
QLineEdit#editorLabel {
    background-color: #ffffec;
    font-family:YaHei Mono;
    /* 沒有直接對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
    border: 2px;
    margin: 2px;
}</t>
<t tx="leo.20210425195349.3">horizontal: body pane to the left
vertical: body pane on the botton</t>
<t tx="leo.20210425195403.1">@language python
'''Use leo editor as IDE to development Package
ctrl + b to execute script
Recursively import all python files in a directory and clean the result.
'''

c.recursiveImport(
    dir_ = r'./',
    # use @clean to parse the associated files
    kind = '@clean',
    # if save_at_file = True, @@ will use to protect the source codes
    safe_at_file = False,
    theTypes = ['.py']
)
</t>
<t tx="leo.20210425195403.2">'''Recursively import all python files in a directory and clean the result.
ctrl + b to execute
'''

c.recursiveImport(
    dir_ = r'./',
    kind = '@clean',
    safe_at_file = False,
    theTypes = ['.py']
)</t>
<t tx="leo.20210425195432.1"></t>
<t tx="leo.20210425195432.2"></t>
<t tx="leo.20210425195432.3">@path ./
@others
if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8080, debug=True)
@language python
@tabwidth -4
</t>
<t tx="leo.20210425195432.4"># 導入 requsts 模組
import requests
# 導入 bs4 模組
import bs4
# for os.environ and os.system
import os
# for geting html file path
import pathlib
# 以下因應改為 Heroku based 程式所需導入模組,  修改步驟 1/6 -----
from flask import Flask, request 
# 為了讓網際程式可以跨網域擷取資料, 導入 flsk_cors 中的 CORS 類別
from flask_cors import CORS


# 修改步驟 2/6 , 加入 Flask 相關物件設定 ------
app = Flask(__name__)
# 此一設定可以讓程式跨網域擷取資料
CORS(app)

# for pythn 3.9,  在近端測試時仍需要設定 proxy, 若使用 Python 3.8 執行則會自動使用系統的 Proxy 設定
# 推向 Heroku 之前必須將 proxy 蓋掉
'''
proxy = 'http://[2001:288:6004:17::69]:3128'

os.environ['http_proxy'] = proxy 
os.environ['HTTP_PROXY'] = proxy
os.environ['https_proxy'] = proxy
os.environ['HTTPS_PROXY'] = proxy
'''
'''
url:  'jclassroom_ajax.php',
data: { pselyr: pselyr, pselclssroom: pselclssroom },
'''

# 修改步驟 3/6, 試著將程式改為網際模式, 需要套用 Flask 的網際 decorator ------
</t>
<t tx="leo.20210425195432.5">@app.route('/')
def timeTableList():
    # 修改步驟 7/6, 為了讓使用者可以透過網際 GET 設定以下兩個變數, 必須先蓋掉原先直接設定學期與實驗室代號的部分, 改為透過 request 取得
    '''
    &lt;option value="BGA0611" &gt;BGA0611 (研討室(三)_綜合工程一館 6F)&lt;/option&gt;
    &lt;option value="BGA0620" &gt;BGA0620 (動態系統實驗室_綜合工程一館 6F)&lt;/option&gt;
    &lt;option value="BGA0640" &gt;BGA0640 (創意設計室_綜合工程一館 6F)&lt;/option&gt;
    &lt;option value="BGA0710" &gt;BGA0710 (研討室(二)_綜合工程一館 7F)&lt;/option&gt;
    &lt;option value="BGA0730" &gt;BGA0730 (研討室(一)_綜合工程一館 7F)&lt;/option&gt;
    &lt;option value="BGA0760" &gt;BGA0760 (逆向快速成型實驗室_綜合工程一館 7F)&lt;/option&gt;
    &lt;option value="BGA0810" &gt;BGA0810 (電腦輔助設計室_綜合工程一館 8F)&lt;/option&gt;
    &lt;option value="BGA0820" &gt;BGA0820 (智慧感測與致動實驗室_綜合工程一館 8F)&lt;/option&gt;
    &lt;option value="BGA0823" &gt;BGA0823 (新產品創意設計中心_綜合工程一館 8F)&lt;/option&gt;
    &lt;option value="BGA0830" &gt;BGA0830 (電腦輔助繪圖室_綜合工程一館 8F)&lt;/option&gt;
    &lt;option value="BGA0842" &gt;BGA0842 (機械元件設計實驗室_綜合工程一館 8F)&lt;/option&gt;
    &lt;option value="BGA0901" &gt;BGA0901 (國際會議廳_綜合工程一館 9F)&lt;/option&gt;
    &lt;option value="BGA0911" &gt;BGA0911 (機電實驗室_綜合工程一館 9F)&lt;/option&gt;
    '''
    '''
    semester = '1092'
    classroomno = 'BGA0810'
    column = True
    '''
    # 利用 flask 導入的 request 物件的 args 中的 get 方法取 semester 與 classroomno 等變數
    semester = request.args.get('semester')
    classroomno = request.args.get('classroomno')

    # 若使用者並無輸入 GET 變數, 則設為內定值
    if semester == None:
        semester = '1092'
    if classroomno == None:
        # BGA0810 電腦輔助設計室
        classroomno = 'BGA0810'
    #print(semester, classroomno)
    
    # 採用內定的 AJAX 標頭 dict
    headers = {'X-Requested-With': 'XMLHttpRequest'}

    # 設定校務主機中用來擷取教室排課的程式
    url = 'https://qry.nfu.edu.tw/jclassroom_ajax.php'
    # 配合主機中的變數名稱進行設定
    # pselyr 與 pselclssroom 由校主機決定, semester 與 classroomno 可自訂
    post_var = {'pselyr': semester, 'pselclssroom': classroomno}

    # 利用 POST 送出資料進行查詢
    result = requests.post(url, data = post_var, headers = headers)

    # 利用 bs4 中的 BeautifulSoup 方法解讀查詢內容
    soup = bs4.BeautifulSoup(result.content, 'lxml')

    # 先除掉所有 anchor
    for a in soup.findAll('a'):
        # bs3 語法
        #a.replaceWithChildren()
        # bs4 語法, 將標註與內容拆開
        a.unwrap()

    # 根據輸出設定, 取出 class='tbcls' 的 table 資料
    table = soup.find('table', {'class': 'tbcls'})

    # 為了取得實驗室排課表中各時段所排的課程, 需要對 table 加以進一步解讀
    # 先回歸到單機程式進行測試
    
    # ########## 以下程式碼用來計算排課節數 ##########
    # 以下取出 td 標註資料
    table_data = [i.text for i in table.find_all('td')]
    #print(table_data)
    timeTable = []
    # 去除非排課欄位資料內容
    for i in table_data:
        if not "虎尾科技" in i and not "節" in i and not "\xa0" in i:
            timeTable.append(i)
    #print(len(timeTable))
    totalNum = len(timeTable)
    # ########## 以上程式碼用來計算排課節數 ##########

    # 重建 table, 設定邊線為 1 pixel
    output = "總排課節數: " + str(totalNum) + "&lt;br /&gt;&lt;br /&gt;&lt;table border='1'&gt;"

    for i in table.contents:
        # 利用 replace 復原 &amp;nbsp;
        output += str(i).replace("&amp;amp;nbsp", "&amp;nbsp;")
    output += "&lt;/table&gt;"
    #print(output)
    # 修改步驟 5/6 , 因為已經將原先可列印出程式的步驟改為 function, 因此必須以 return 將擷取到的網頁資料傳回
    return output

</t>
<t tx="leo.20210425195432.6">@app.route('/table')
def timeTable():
    return '''
    &lt;table style="border-collapse: collapse; width: 83.6478%; height: 90px;" border="1"&gt;
&lt;tbody&gt;
&lt;tr style="height: 18px;"&gt;
&lt;td style="width: 16.6667%; height: 18px; text-align: center;"&gt;樓層&lt;/td&gt;
&lt;td style="width: 13.3648%; height: 18px;"&gt;&amp;nbsp;&lt;/td&gt;
&lt;td style="width: 13.2076%; height: 18px;"&gt;&amp;nbsp;&lt;/td&gt;
&lt;td style="width: 12.2642%; height: 18px;"&gt;&amp;nbsp;&lt;/td&gt;
&lt;td style="width: 12.4214%; height: 18px;"&gt;&amp;nbsp;&lt;/td&gt;
&lt;td style="width: 15.7233%; height: 18px;"&gt;&amp;nbsp;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr style="height: 18px;"&gt;
&lt;td style="width: 16.6667%; text-align: center; height: 18px;"&gt;9 F&lt;/td&gt;
&lt;td style="width: 13.3648%; height: 18px;"&gt;&lt;a href="https://nfumde.herokuapp.com/?classroomno=BGA0911"&gt;機電實驗室&lt;/a&gt;&lt;/td&gt;
&lt;td style="width: 13.2076%; height: 18px;"&gt;&amp;nbsp;&lt;/td&gt;
&lt;td style="width: 12.2642%; height: 18px;"&gt;&amp;nbsp;&lt;/td&gt;
&lt;td style="width: 12.4214%; height: 18px;"&gt;&amp;nbsp;&lt;/td&gt;
&lt;td style="width: 15.7233%; height: 18px;"&gt;&amp;nbsp;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr style="height: 18px;"&gt;
&lt;td style="width: 16.6667%; text-align: center; height: 18px;"&gt;8 F&lt;/td&gt;
&lt;td style="width: 13.3648%; height: 18px;"&gt;&lt;a href="https://nfumde.herokuapp.com/?classroomno=BGA0842"&gt;機械元件&lt;/a&gt;&lt;/td&gt;
&lt;td style="width: 13.2076%; height: 18px;"&gt;&lt;a href="https://nfumde.herokuapp.com/?classroomno=BGA0830"&gt;輔助繪圖室&lt;/a&gt;&lt;/td&gt;
&lt;td style="width: 12.2642%; height: 18px;"&gt;&lt;a href="https://nfumde.herokuapp.com/?classroomno=BGA0823"&gt;新產品&lt;/a&gt;&lt;/td&gt;
&lt;td style="width: 12.4214%; height: 18px;"&gt;&lt;a href="https://nfumde.herokuapp.com/?classroomno=BGA0820"&gt;智慧感測&lt;/a&gt;&lt;/td&gt;
&lt;td style="width: 15.7233%; height: 18px;"&gt;&lt;a href="https://nfumde.herokuapp.com/?classroomno=BGA0810"&gt;輔助設計室&lt;/a&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr style="height: 18px;"&gt;
&lt;td style="width: 16.6667%; text-align: center; height: 18px;"&gt;7 F&lt;/td&gt;
&lt;td style="width: 13.3648%; height: 18px;"&gt;&lt;a href="https://nfumde.herokuapp.com/?classroomno=BGA0760"&gt;逆向&lt;/a&gt;&lt;/td&gt;
&lt;td style="width: 13.2076%; height: 18px;"&gt;&lt;a href="https://nfumde.herokuapp.com/?classroomno=BGA0730"&gt;研討室(一)&lt;/a&gt;&lt;/td&gt;
&lt;td style="width: 12.2642%; height: 18px;"&gt;&lt;a href="https://nfumde.herokuapp.com/?classroomno=BGA0710"&gt;研討室(二)&lt;/a&gt;&lt;/td&gt;
&lt;td style="width: 12.4214%; height: 18px;"&gt;&amp;nbsp;&lt;/td&gt;
&lt;td style="width: 15.7233%; height: 18px;"&gt;&amp;nbsp;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr style="height: 18px;"&gt;
&lt;td style="width: 16.6667%; text-align: center; height: 18px;"&gt;6 F&lt;/td&gt;
&lt;td style="width: 13.3648%; height: 18px;"&gt;&lt;a href="https://nfumde.herokuapp.com/?classroomno=BGA0611"&gt;創意設計&lt;/a&gt;&lt;/td&gt;
&lt;td style="width: 13.2076%; height: 18px;"&gt;&lt;a href="https://nfumde.herokuapp.com/?classroomno=BGA0620"&gt;動態系統&lt;/a&gt;&lt;/td&gt;
&lt;td style="width: 12.2642%; height: 18px;"&gt;&lt;a href="https://nfumde.herokuapp.com/?classroomno=BGA0611"&gt;研討室(三)&lt;/a&gt;&lt;/td&gt;
&lt;td style="width: 12.4214%; height: 18px;"&gt;&amp;nbsp;&lt;/td&gt;
&lt;td style="width: 15.7233%; height: 18px;"&gt;&amp;nbsp;&lt;/td&gt;
&lt;/tr&gt;
&lt;/tbody&gt;
&lt;/table&gt;
&lt;br /&gt; 程式碼: &lt;a href="https://github.com/mdecourse/nfumde"&gt;https://github.com/mdecourse/nfumde&lt;/a&gt;
    '''
    
# 修改步驟 4/6 , 因為改寫為網際程式後, 下列將內容存檔並自動呼叫 Firefox 的程式碼不再適用, 必須蓋掉
'''
# 將 output 寫入 w1_classroom.html
fileName = "w1_classroom.html"
with open(fileName, "w", encoding="utf-8") as file:
    file.write(output)
# 利用 os.system() 以 default browser 開啟 w1_class_local.html
filePath = pathlib.Path(__file__).parent.absolute()
#print(filePath)
# set firefox as default browser and start url to open html file
os.system("start file:///" + str(filePath) + "\\" + fileName)
'''

# 修改步驟 6/6, 配合網際程式啟動,  以及 Python 程式執行與納入其他程式執行的特定進行配置

</t>
<t tx="leo.20210425201313.1">@language python

import requests
import bs4
# for os.environ and os.system
import os
# for geting html file path
import pathlib
import re

# *args 表示 leoprint 可以接受任意數量的輸入變數
def leoprint(*args):
    try:
        g.es(*args)
    except:
        print(*args)

# for pythn 3.9
proxy = 'http://[2001:288:6004:17::53]:3128'

os.environ['http_proxy'] = proxy 
os.environ['HTTP_PROXY'] = proxy
os.environ['https_proxy'] = proxy
os.environ['HTTPS_PROXY'] = proxy

'''
url:  'jclassroom_ajax.php',
data: { pselyr: pselyr, pselclssroom: pselclssroom },
'''
semester = '1092'
classroomno = 'BGA0810'
column = True

if semester == None:
    semester = '1092'
if classroomno == None:
    # BGA0810 電腦輔助設計室
    classroomno = 'BGA0810'
    
headers = {'X-Requested-With': 'XMLHttpRequest'}

url = 'https://qry.nfu.edu.tw/jclassroom_ajax.php'
post_var = {'pselyr': semester, 'pselclssroom': classroomno}

result = requests.post(url, data = post_var, headers = headers)

soup = bs4.BeautifulSoup(result.content, 'lxml')

# 先除掉所有 anchor
for a in soup.findAll('a'):
    # bs3 語法
    #a.replaceWithChildren()
    # bs4 語法, 將標註與內容拆開
    a.unwrap()

# 根據輸出設定, 取出 class='tbcls' 的 table 資料
table = soup.find('table', {'class': 'tbcls'})

# 以下要準備能夠輸入資料庫的排課時段資料 #########################
tds = [row.findAll('td') for row in table.findAll('tr')]
#leoprint(tds)
count = 0
row = 0
results = {}
for td in tds:
    row = row + 1
    for i in range(len(td)):
        if i != 0 and td[i].text != "\xa0":
            leoprint("星期"+str(i), "第"+str(row-2) + "節-", re.sub('&lt;[^&lt;]+?&gt;', '', td[i].text))
            count = count + 1
    #leoprint("***************")
leoprint("total:" + str(count))
# 以上已經取得能夠輸入資料庫的排課時段資料 ######################

# ########## 以下程式碼用來計算排課節數 ###########################
# 以下取出 td 標註資料
table_data = [i.text for i in table.find_all('td')]
#leoprint(table_data)
timeTable = []
# 去除非排課欄位資料內容
for i in table_data:
    if not "虎尾科技" in i and not "節" in i and not "\xa0" in i:
        timeTable.append(i)
#leoprint(len(timeTable))
totalNum = len(timeTable)
# ########## 以上程式碼用來計算排課節數 ##########################

# 重建 table, 設定邊線為 1 pixel
output = "總排課節數: " + str(totalNum) + "&lt;br /&gt;&lt;br /&gt;&lt;table border='1'&gt;"

for i in table.contents:
    # 利用 replace 復原 &amp;nbsp;
    output += str(i).replace("&amp;amp;nbsp", "&amp;nbsp;")
output += "&lt;/table&gt;"

#leoprint(output)

'''
# 將 output 寫入 w1_classroom.html
fileName = "w1_classroom.html"
with open(fileName, "w", encoding="utf-8") as file:
    file.write(output)
# 利用 os.system() 以 default browser 開啟 w1_class_local.html
filePath = pathlib.Path(__file__).parent.absolute()
#print(filePath)
# set firefox as default browser and start url to open html file
os.system("start file:///" + str(filePath) + "\\" + fileName)
'''</t>
<t tx="leo.20210425201616.1">[[&lt;td colspan="8"&gt;&lt;center&gt;國立虎尾科技大學  109 學年度第 2 學期  BGA0810教室使用時間表&lt;/center&gt;&lt;/td&gt;],
 [], 
 [&lt;td&gt;第一節&lt;/td&gt;, &lt;td&gt;四設計一甲&lt;br/&gt;工廠實習(二)CNC及CAM實習&lt;br/&gt;蕭俊卿&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt;四設計三乙&lt;br/&gt;工程設計&lt;br/&gt;周榮源&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;] , 
 
 [&lt;td&gt;第二節&lt;/td&gt;, &lt;td&gt;四設計一甲&lt;br/&gt;工廠實習(二)CNC及CAM實習&lt;br/&gt;蕭俊卿&lt;/td&gt;, &lt;td&gt;四設計二攜&lt;br/&gt;電腦輔助設計實習&lt;br/&gt;蕭俊卿&lt;/td&gt;, &lt;td&gt;四設計三乙&lt;br/&gt;工程設計&lt;br/&gt;周榮源&lt;/td&gt;, &lt;td&gt;四設計一甲&lt;br/&gt;網際內容管理&lt;br/&gt;嚴家銘&lt;/td&gt;, &lt;td&gt;五精一甲&lt;br/&gt;網際內容管理&lt;br/&gt;嚴家銘&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;],
 
  [&lt;td&gt;第三節&lt;/td&gt;, &lt;td&gt;四設計一甲&lt;br/&gt;工廠實習(二)CNC及CAM實習&lt;br/&gt;蕭俊卿&lt;/td&gt;, &lt;td&gt;四設計二攜&lt;br/&gt;電腦輔助設計實習&lt;br/&gt;蕭俊卿&lt;/td&gt;, &lt;td&gt;四設計三乙&lt;br/&gt;工程設計&lt;br/&gt;周榮源&lt;/td&gt;, &lt;td&gt;四設計一甲&lt;br/&gt;網際內容管理&lt;br/&gt;嚴家銘&lt;/td&gt;, &lt;td&gt;五精一甲&lt;br/&gt;網際內容管理&lt;br/&gt;嚴家銘&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;], 
  
  [&lt;td&gt;第四節&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt;四設計二攜&lt;br/&gt;電腦輔助設計實習&lt;br/&gt;蕭俊卿&lt;/td&gt;, &lt;td&gt;四設計三乙&lt;br/&gt;工程設計&lt;br/&gt;周榮源&lt;/td&gt;, &lt;td&gt;四設計一甲&lt;br/&gt;網際內容管理&lt;br/&gt;嚴家銘&lt;/td&gt;, &lt;td&gt;五精一甲&lt;br/&gt;網際內容管理&lt;br/&gt;嚴家銘&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;],
  
 [&lt;td&gt;第五節&lt;/td&gt;, &lt;td&gt;五精三甲&lt;br/&gt;數控加工實習(二)&lt;br/&gt;林啓仁&lt;/td&gt;, &lt;td&gt;四設計三甲&lt;br/&gt;工程設計&lt;br/&gt;周榮源&lt;/td&gt;, &lt;td&gt;四設計二攜&lt;br/&gt;機器動力學&lt;br/&gt;黃運琳&lt;/td&gt;, &lt;td&gt;四設計二甲&lt;br/&gt;協同產品設計實習&lt;br/&gt;嚴家銘&lt;/td&gt;, &lt;td&gt;四設計二乙&lt;br/&gt;協同產品設計實習&lt;br/&gt;嚴家銘&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;], [&lt;td&gt;第六節&lt;/td&gt;, &lt;td&gt;五精三甲&lt;br/&gt;數控加工實習(二)&lt;br/&gt;林啓仁&lt;/td&gt;, &lt;td&gt;四設計三甲&lt;br/&gt;工程設計&lt;br/&gt;周榮源&lt;/td&gt;, &lt;td&gt;四設計二攜&lt;br/&gt;機器動力學&lt;br/&gt;黃運琳&lt;/td&gt;, &lt;td&gt;四設計二甲&lt;br/&gt;協同產品設計實習&lt;br/&gt;嚴家銘&lt;/td&gt;, &lt;td&gt;四設計二乙&lt;br/&gt;協同產品設計實習&lt;br/&gt;嚴家銘&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;], [&lt;td&gt;第七節&lt;/td&gt;, &lt;td&gt;五精三甲&lt;br/&gt;數控加工實習(二)&lt;br/&gt;林啓仁&lt;/td&gt;, &lt;td&gt;四設計三甲&lt;br/&gt;工程設計&lt;br/&gt;周榮源&lt;/td&gt;, &lt;td&gt;四設計二攜&lt;br/&gt;機器動力學&lt;br/&gt;黃運琳&lt;/td&gt;, &lt;td&gt;四設計二甲&lt;br/&gt;協同產品設計實習&lt;br/&gt;嚴家銘&lt;/td&gt;, &lt;td&gt;四設計二乙&lt;br/&gt;協同產品設計實習&lt;br/&gt;嚴家銘&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;], [&lt;td&gt;第八節&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt;四設計三甲&lt;br/&gt;工程設計&lt;br/&gt;周榮源&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt;四設計二甲&lt;br/&gt;協同產品設計實習&lt;br/&gt;嚴家銘&lt;/td&gt;, &lt;td&gt;四設計二乙&lt;br/&gt;協同產品設計實習&lt;br/&gt;嚴家銘&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;], [&lt;td&gt;第九節&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;], [&lt;td&gt;第十節&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;], [&lt;td&gt;第十一節&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;], [&lt;td&gt;第十二節&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;], [&lt;td&gt;第十三節&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;], [&lt;td&gt;第十四節&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;], [&lt;td&gt;第十五節&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;], [&lt;td&gt;第十六節&lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;, &lt;td&gt; &lt;/td&gt;]]
</t>
</tnodes>
</leo_file>
