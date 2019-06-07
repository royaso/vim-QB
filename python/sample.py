import vim
import requests
from bs4 import BeautifulSoup as bs

def get_country():
    return "china"

def insert_country():
    row,col=vim.current.window.cursor
    current_line=vim.current.buffer[row-1]
    new_line=current_line[:col]+get_country()+current_line[col:]
    vim.current.buffer[row-1]=new_line

def QB():
    html=requests.get('https://www.qiushibaike.com/text/')
    if html.status_code ==requests.codes.ok:
        all=bs(html.text,features='lxml')
        all=all.select('.article')
        all=[item.select('.content>span')[0].get_text().strip() for item in all ]
        all=[item for item in all if len(item) > 11] #有些结果是图片，去除掉
        vim.current.buffer.append(all)


#print(QB())
