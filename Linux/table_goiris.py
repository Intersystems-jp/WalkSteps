import sys
import matplotlib.pyplot as plt

import iris

def getMonthTbl():
    rs=iris.sql.exec("select DATEPART('MM',RecordDate) As month from MyHealth.Steps group by DATEPART('MM',RecordDate)")
    monthlist=[]
    for row in enumerate(rs):
        monthlist.append(row[1][0]) 
    return monthlist


def createChartFromTbl(monthnumber):
    sql="select tochar(RecordDate,'DD'),Steps from MyHealth.Steps WHERE DATEPART('MM',recorddate) = ?"
    stmt=iris.sql.prepare(sql)
    rs=stmt.execute(monthnumber) 
    
    rdate=[]
    steps=[]
    for row in enumerate(rs):
        rdate.append(row[1][0])
        steps.append(row[1][1])
    
    #plt.plot(rdate,steps,marker="o",color="red",linestyle="--")
    #plt.show()
    return rdate,steps
