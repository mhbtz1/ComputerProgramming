#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Dec 15 15:49:28 2019

@author: tarem21
"""

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
import seaborn as sns
import random
import math

 
def mod_func(x, a0, a1):
    return a0 + (a1*x)


df = pd.read_excel('/Users/tarem21/Library/Containers/com.microsoft.Excel/Data/Downloads/DrivingData.xlsx')

print(df.info());

dict = {}
dict2 = {}
dict3 = {}

#plt.scatter(df['Trip Time'], df['Stop Signs'], marker = '.')

tempDF = df['Route']
tempAM = df[df['AM/PM'] == 'AM']
routeAM = list(tempAM['Route'])
tempPM = df[df['AM/PM'] == 'PM']
routePM = list(tempPM['Route'])

tripTime = df['Trip Time']


for i in range(0,len(df['Route'])):
    tempDF[i] = (tempDF[i]).upper()
for i in range(0, len(routeAM)):
    routeAM[i] = routeAM[i].upper()
for i in range(0, len(routePM)):
    routePM[i] = routePM[i].upper()


for i in tempDF:
    if(i in dict):
        dict[i] += 1
    else:
        dict[i] = 1
for i in routeAM:
    if(i in dict2):
        dict2[i] += 1
    else:
        dict2[i] = 1
for i in routePM:
    if(i in dict3):
        dict3[i] += 1
    else:
        dict3[i] = 1

        

maxRoute = ""
occ = 0
maxRouteAM = ""
occ2 = 0
maxRoutePM = ""
occ3 = 0

for i in tempDF:
    if(max(occ,dict[i]) == dict[i]):
        maxRoute = i
        occ = dict[i]
for i in routeAM:
    if(max(occ2, dict2[i]) == dict2[i]):
        maxRouteAM = i
        occ2 = dict2[i]
for i in routePM:
    if(max(occ3, dict3[i]) == dict3[i]):
        maxRoutePM = i
        occ3 = dict3[i]
        
longestTime = 0
longestRoute = ""
shortestTime = 100000000
shortestRoute = ""
for i in range(0,len(tripTime)):
    longestTime = max(longestTime, tripTime[i])
    if(longestTime == tripTime[i]):
        longestRoute = tempDF[i]
    shortestTime = min(shortestTime, tripTime[i])
    if(shortestTime == tripTime[i]):
        shortestRoute = tempDF[i]

print("MOST OCCURRING ROUTE: " + str(occ) + " " + str(maxRoute))#evidently delch-wh is the most occurring route
print("MOST OCCURRING ROUTE IN THE MORNING: " + str(occ2) + " " + str(maxRouteAM))#also delch-wh at AM
print("MOST OCCURRING ROUTE IN THE NIGHT: " + str(occ3) + " " + str(maxRoutePM))#vr-926-prov gos in PM

print("SHORTEST TIME FOR A ROUTE AND ITS TIME: " + str(shortestTime) + " " + str(shortestRoute))
print("LONGEST TIME FOR A ROUTE AND ITS TIME: " + str(longestTime) + " " + str(longestRoute))

print(np.percentile(df['Trip Time'], [25,75]))

plt.title("Time for both AM and PM")
plt.hist(df['Trip Time'], bins = len(df['Trip Time']))
plt.show()
plt.clf()
plt.title("Time for just AM")
plt.hist(tempAM['Trip Time'], bins = len(tempAM['Trip Time']))
plt.show()
plt.clf()
plt.title("Time for just PM")
plt.hist(tempPM['Trip Time'], bins = len(tempPM['Trip Time']))
plt.show()
plt.clf()

print("STANDARD DEVIATION AND MEAN OF OVERALL")
print( str(np.std(list(df['Trip Time']))) + " " + str(np.mean(list(df['Trip Time']))) )
print("STANDARD DEVIATION AND MEAN OF AM")
print( str(np.std(list(tempAM['Trip Time']))) + " " + str(np.mean(list(tempAM['Trip Time']))))
print("STANDARD DEVIATION AND MEAN22 OF PM")
print( str(np.std(list(tempPM['Trip Time']))) + " " + str(np.mean(list(tempPM['Trip Time']))) )
#--------------------------------------------------
tempList = []
tempDiff = []
lOne = df['Stop Lights']
lTwo = df['Stop Signs']
for i in range(0,len(df['Stop Lights'])):
    tempList.append(lOne[i] + lTwo[i])
    tempDiff.append(lOne[i] - lTwo[i])#number of stop lights minus number of stop signs

df['Total Stops'] = tempList
df['Stop Diffs'] = tempDiff
#print(df['Total Stops'])

plt.hist(df['Total Stops'], bins = len(df['Total Stops']))
plt.show();
plt.clf()
plt.hist(df['Stop Diffs'], bins = len(df['Total Stops']))

print(np.mean(tempAM['Trip Time']) - np.mean(tempPM['Trip Time']) )#the mean of arrival time in the mornings is less than at pm(i.e. it is earlier in morning)

arr = df['Time left']
new_times = []
for i in arr:
    new_str1 = i.strftime("%H")
    new_str2 = i.strftime("%M")
    new_str3 = i.strftime("%S")
    new_times.append(float(new_str3) + (60 * (float)(new_str2) ) + (3600 * (float)(new_str1) ))


meanVal = 10.89


stops = np.array(df['Total Stops'])
newStops = []
for i in range(0,len(df['Total Stops'])):
    if(not math.isnan(stops[i])):
        #print(stops[i])
        newStops.append(stops[i])
        meanVal += stops[i]
    else:
        newStops.append(meanVal)
        

#print(newStops)
#meanVals = np.mean(newStops):


#print(counter)
#print(len(df['Total Stops']))

newTotal = []
for i in df['Total Stops']:
    if i is None:
        newTotal.append(meanVal)
    else:
        newTotal.append(i)
        
#print(df['Total Stops'])

popt, pcov = curve_fit(mod_func, new_times, df['Trip Time'])
popt1, pcov1 = curve_fit(mod_func, new_times, newStops)
print("TRIP TIME Y INTERCEPT: " + str(popt[0]))#y-intercept
print("TRIP TIME SLOPE: " + str(popt[1]))#slope
print("NEW STOPS Y INTERCEPT: " + str(popt1[0]))#y_intercept
print("NEW STOPS SLOPE: " + str(popt1[1])) #slope



actualPoints = []
xValues = []
xValues2 = []
actualPoints2 = []
residuals = []

times = df['Trip Time']


for i in range(0,25000):
    actualPoints.append( (popt[1] * i) + popt[0] )
    xValues.append(i);
for i in range(0,28000):
    actualPoints2.append( (popt1[1] * i) + popt1[0])
    xValues2.append(i)


for i in range(0,len(times)):
    residuals.append( abs(times[i] - actualPoints[times[i]] ) )
    

print(residuals)
print(np.std(residuals))
res1 = np.corrcoef(residuals)
res2 = (np.corrcoef(residuals))**2
print("R VALUE FOR THE RESIDUALS: " + str(res1) )
print("COEFFICIENT OF DETERMINATION FOR THE RESIDUALS: " + str(res2) )

plt.title("Regression for Trip Time and Leaving Time")
plt.scatter(new_times, df['Trip Time'], color = 'red')
plt.scatter(xValues, actualPoints, color = 'blue')
plt.show()
plt.clf()
plt.title("Regression for Trip Time and Number of Stops")
plt.scatter(new_times, newStops, color = 'blue')
plt.scatter(xValues2, actualPoints2, color = 'red')
plt.show()
plt.clf()

overallMeanTimes = []
for i in range(0,10000):
    bootstrappedTimes = []
    for j in range(0, random.randint(1,len(times)) ):
        bootstrappedTimes.append(times[random.randint(0,len(times) - 1)])
    overallMeanTimes.append(np.mean(bootstrappedTimes))


plt.title("Bootstrapping Histogram")
plt.hist(overallMeanTimes)


plt.show()
plt.clf()

print(np.percentile(overallMeanTimes, 2.5))
print(np.percentile(overallMeanTimes, 97.5))


#second most frequent route is 926-GM-WH
for i in df['Route']:
    print(str(i) + " " + str(dict[i]) )


netMean = []
for i in range(0,len(df['Trip Time'])):
    sampleMean = []
    for j in range(0, random.randint(1,1000)):
        value = random.randint(0,1)
        if(value == 0):
            sampleMean.append(13)
        else:
            sampleMean.append(12)
    netMean.append(np.mean(sampleMean))

plt.title("Histogram for A/B Testing")
plt.hist(netMean, bins = 20)#considering that the area in this graph is skewed more towards 12 than 13




        
