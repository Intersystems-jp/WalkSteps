import sys
import matplotlib.pyplot as plt

import iris

def getMonthGlo():
    glo=iris.gref("^MySteps")
    monthlist=[]
    month=""
    while True:
        month=glo.order([2022,month])
        if (month==None):
            break
        monthlist.append(month)
    return monthlist        

def createChartFromGlo(monthnumber):
    glo=iris.gref("^MySteps")

    rdate=[]
    steps=[]
    date=""
    while True:
        date=glo.order([2022,monthnumber,date])
        if (date==None):
            break
        rdate.append(date)
        steps.append(glo[2022,monthnumber,date])
    
    #plt.plot(rdate,steps,marker="o",color="red",linestyle="--")
    #plt.show()
    return rdate,steps
