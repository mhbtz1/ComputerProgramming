#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Nov 15 20:54:34 2019

@author: tarem21
"""

import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression
from statsmodels.formula.api import ols
from scipy import optimize
import matplotlib.pyplot as plt
import math as m

value_matrix = [ [0.0000000 for x in range(0,4)] for y in range(0,4)]
fuzzy_matrix  = [ [0.0000000 for x in range(0,4)] for y in range(0,4)]

factor_weights = []
weight_vectors = []


STATE_COST = { {'alabama' : 9.83 },
                { 'alaska' :  19.10 },
               { 'arizona' : 	10.64 },
               { 'arkansas':	 8.26 },
               { 'california': 	16.06	},
               { 'colorado':	 9.99	},
               { 'connecticut'	: 17.55	},
               { 'delaware	' :10.91	},
               { 'district of columbia': 11.80	},
               { 'florida'	 : 10.42	},
               { 'georgia'	 : 9.83	},
               { 'hawaii'	: 26.05	},
               { 'idaho'	: 8.26	},
               { 'illinois	' : 9.49	},
               { 'indiana': 	9.77	},
               { 'iowa' 	: 8.73	},
               { 'kansas'	: 10.60	},
               { 'kentucky' 	: 8.57	},
               { 'louisiana'	: 7.79	},
               { 'maine'	: 13.02	},
               { 'maryland' 	: 11.98	},
               { 'massachusetts'	: 17.12	},
               { 'michigan'	: 11.28	},
               { 'minnesota'	: 10.27	},
               { 'mississippi'	: 9.09	},
               { 'missouri	' : 10.03	},
               {'montana'	: 8.92	},
               { 'nebraska' 	: 9.08	},
               { 'nevada'	: 8.76	},
               { 'new hampshire'  : 	16.17	},
               { 'new jersey'	: 13.32	},
               { 'new mexico'	: 9.59	},
               { 'new york' : 	14.74	},
               { 'north carolina' : 	9.04	},
               { 'north dakota' : 	8.78	},
               { 'ohio' 	: 9.84	},
               { 'oklahoma' : 	8.20	},
               {' oregon'	: 8.81	},
               {'pennsylvania'	 : 10.13	},
               {'rhode island'	 : 16.42	},
               { 'south carolina'	: 9.97	},
               { 'south dakota'	: 10.05	},
               { 'tennessee'	: 9.45	},
               { 'texas'	: 8.38	},
               { 'utah	' : 8.60	},
               { 'vermont' 	: 14.60	},
               { 'virginia' 	: 9.18	},
               {'washington'	: 7.94	},
               {'west virginia' 	: 9.00	},
               {'wisconsin' 	: 10.76	},
               { "wyoming"	: 8.28} 
             }


def absoluteCost(state, year, dollarValue, electricFactor, pcFactor, phoneFactor, timeElectric, timePC, timePhone):
    totCost = 0
    totCost += (STATE_COST[state]*new_func(year)(timeElectric/120)*electricFactor)
    totCost+=(STATE_COST[state] * new_func2(year)(timePC/120))*pcFactor
    totCost += ((STATE_COST[state]) * new_func3(2000 + year) * (timePhone)/120)*phoneFactor
    return totCost
    

#for the sake of weighing the factors
#need to weigh how much certain devices will factor into the cost
#(i.e. electric vehicles, phones, laptops, tablets, etc)

def sum(colNum, rowLength):
    ret = 0
    for i in range(0, rowLength):
        ret += value_matrix[i][colNum]
    return ret

def normalize(colLength, rowLength):
    for i in range(0,rowLength):
        for j in range(0, colLength):
                value = sum(j,rowLength)
                value_matrix[i][j] = float(value_matrix[i][j])/value
                

def entropy_weights(value_matrix, colLen, rowLen):
    const = -1/np.log(rowLen)
    
    for i in range(0,3):
        prod = 0
        for j in range(0,4):
            #prod += value_matrix[i][j] * (m.log(value_matrix[i][j]))
            if(value_matrix[j][i] != 0):
                fuzzy_matrix[j][i] = value_matrix[j][i] * m.log( float(abs(value_matrix[j][i])) )
    
    for i in range(0, colLen):
        sum = 0.000
        for j in range(0, rowLen):
            sum += fuzzy_matrix[j][i]
        sum *= const
        print("SUM VALUE: " + str(sum) )
        print(" ")
        factor_weights.append(sum)

def sigsum(cur):
    ret = 0
    for i in factor_weights:
        ret += 1 - i
    return (1 - factor_weights[cur])/ret;

def weightVector():
    for i in range(0, len(factor_weights)):
        weight_vectors.append(sigsum(i))
        
def new_func(x):
    return float((param_opt[0] * m.exp(param_opt[1] * x)) + param_opt[2])
def new_func2(x):
    return float((param_opt2[0] * m.log(param_opt2[1]*x)) + param_opt2[2])
def new_func3(x):
    return float((param_opt3[0] * m.log(param_opt3[1] *x)) + param_opt3[2])
def func(x, a, b, c):
 return (a * np.exp(b * x)) + c
def func2(x, a1, b1, c1):
  return (a1 * np.log(b1*x) + c1)  
def func3(x, a1, b1, c1):
    return a1*(np.log(b1*x)) + c1



def demandFunctionOne(x):
    return float(-33606.7501 * m.exp(-60.83*x))
def demandFunctionTwo(x1):
    return float(118.17125719/(0.28928151*x1))
def demandFunctionThree(x2):
    return float(0.68748585/(0.00009794*x2))
    


df = pd.read_excel('/Users/tarem21/Library/Containers/com.microsoft.Excel/Data/Downloads/Ev Sales.xlsx')
#df2 = pd.read_excel()
#df3 = pd.read_excel()

names = ['Vehicle', 'Type', '2011','2012','2013','2014','2015','2016','2017','2018','2019']
df.columns = names

print(df.info())

#Data contained in the following arrays are contained in data sources in the bibliography

y = []
x = [11,12,13,14,15,16,17]
x1 = [10,11,12,13,14,15,16,17,18,19,20,21,22,23]
y1 = [62.6, 92.8, 122, 144.5, 171, 190.64, 208.61, 246.6, 257.3, 265.9, 272.6, 277.8, 281.9, 285.3]

x2 = [1984, 1997, 2000, 2001, 2003, 2007, 2009, 2011,2012,2013,2014,2015,2016,2017]
y2 = [8.2, 36.6, 51, 56.3, 61.8, 69.7, 74.1, 76.7, 75.6, 78.9, 83.8, 85.1, 86.8, 89.3]
counter = 48
for i in range(3,10):
    y.append(df.iloc[counter,i])

for i in y:
    print(i)
    

param_opt,param_cov = optimize.curve_fit(func,x, y, maxfev=1000000)
param_opt2, param_cov2 = optimize.curve_fit(func2, x1, y1, maxfev=1000000)
param_opt3, param_cov3 = optimize.curve_fit(func3, x2, y2)


print(str(param_opt2[0]) + " " + str(param_opt2[1]) + " " + str(param_opt2[2]) )

print(float(str(param_opt2[0])))

value_matrix = np.array(value_matrix)

print(str(param_opt3[0]) + " " + str(param_opt[1]) + " " + str(param_opt2[2]) )

#Value Matrix:
#Column 0: Number of Devices in Population
#Column 1: Voltage of Devices
#Column 2: Demand for each of the Devices over Time
#Column 3: Time to charge the battery from roughly half(can be altered based on new intuition)

v1 = new_func(11)
v2 = new_func2(11) * 300.00 * m.pow(10,6)
v3 = new_func3(2011) * 300 * m.pow(10,6)



#NOTE: CODE DOES THE MODEL FOR 2011, BUT OF COURSE IT CAN BE DONE FOR ANY ARBITRARY YEAR

value_matrix[0][0] = v1
value_matrix[0][1] = v2
value_matrix[0][2] = v3

value_matrix[1][0] = 120
value_matrix[1][1] =float(str(3.7))
value_matrix[1][2] =float(str(14.8))

value_matrix[2][0] = float(str(demandFunctionOne(11)))
value_matrix[2][1] = float(str(demandFunctionTwo(11)))
value_matrix[2][2] = float(str(demandFunctionThree(2011)))

value_matrix[3][0] = 30
value_matrix[3][1] = 40
value_matrix[3][2] = 60

normalize(3,4)
entropy_weights(value_matrix, 3, 4)


print(str(v1) + " " + str(v2) + " " + str(v3) )

#print( str(demandFunctionOne(11)) + " " + str(demandFunctionTwo(11)) + " " + str(demandFunctionThree(2011)) )

for i in range(0,4):
    for j in range(0,3):
        print(value_matrix[i][j])
        
for i in factor_weights:
    i *= (-1/m.log(m.e))
    print(i)
factor_weights[0] += 0.1
print(factor_weights)


print(absoluteCost('california', 2011, 1, factor_weights[0], factor_weights[1], factor_weights[2], 30, 40, 60))


