#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Nov 15 20:54:34 2019

@author: tarem21
"""

import pandas as p
import numpy as np
from sklearn.linear_model import LinearRegression
from statsmodels.formula.api import ols
from scipy import optimize
import matplotlib.pyplot as plt
import math as m

value_matrix = [ [0 for x in range(1,5)] for y in range(1,5)]
fuzzy_matrix  = [ [0 for x in range(1,5)] for y in range(1,5)]

fuzzy_matrix = np.array(fuzzy_matrix)

factor_weights = []
weight_vectors = []

#for the sake of weighing the factors
#need to weigh how much certain devices will factor into the cost
#(i.e. electric vehicles, phones, laptops, tablets, etc)
def entropy_weights(value_matrix, colLen, rowLen):
    const = -1/np.log(rowLen)
    
    for i in range(0,colLen):
        prod = 0
        for j in range(0, len(value_matrix[i])):
            prod += value_matrix[i][j] * (m.log(value_matrix[i][j]))
            fuzzy_matrix[i][j] = value_matrix[i][j] * m.log(value_matrix[i][j])
    
    for i in range(0, colLen):
        sum = 0
        for j in range(0, rowLen):
            sum += fuzzy_matrix[j][i]
        sum *= const
        factor_weights.append(sum)

def sigsum(cur):
    ret = 0
    for i in factor_weights:
        ret += 1 - i
    return (1 - factor_weights[cur])/ret;

def weightVector():
    for i in factor_weights:
        weight_vectors.append(sigsum(i))
        
def new_func(x):
    return (param_opt[0] * m.exp(param_opt[1] * x)) + param_opt[2]
def new_func2(x):
    return (param_opt2[0] * m.log(param_opt2[1]*x)) + param_opt2[2]
def new_func3(x):
    return (param_opt3[0] * m.log(param_opt3[1] *x)) + param_opt3[2]
def func(x, a, b, c):
 return (a * np.exp(b * x)) + c
def func2(x, a1, b1, c1):
  return (a1 * np.log(b1*x) + c1)  
def func3(x, a1, b1, c1):
    return a1*(np.log(b1*x)) + c1



def demandFunctionOne(x):
    return -33606.7501 * m.exp(-60.83*x)
def demandFunctionTwo(x1):
    return 118.17125719/(0.28928151*x)
def demandFunctionThree(x2):
    return 0.68748585/(0.00009794*x)
    


df = pd.read_excel('/Users/tarem21/Library/Containers/com.microsoft.Excel/Data/Downloads/Ev Sales.xlsx')
#df2 = pd.read_excel()
#df3 = pd.read_excel()

names = ['Vehicle', 'Type', '2011','2012','2013','2014','2015','2016','2017','2018','2019']
df.columns = names

print(df.info())



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

print(str(a) + " " + str(b) + " " + str(c) )
print(str(param_opt2[0]) + " " + str(param_opt2[1]) + " " + str(param_opt2[2]) )


value_matrix = np.array(value_matrix)

print(str(param_opt3[0]) + " " + str(param_opt[1]) + " " + str(param_opt2[2]) )

#Value Matrix:
#Column 0: Number of Devices in Population
#Column 1: Voltage of Devices
#Column 2: Demand for each of the Devices over Time
#Column 3: Time to charge the battery from roughly half(can be altered based on new intuition)


value_matrix[0][0] = new_func(11)
value_matrix[0][1] = new_func2(11) * 300 * m.pow(10,6)
value_matrix[0][2] = float(new_func3(2011)) * 0.01

value_matrix[1][0] =120
value_matrix[1][1] =3.7 
value_matrix[1][2] =14.8

value_matrix[2][0] = demandFunctionOne(11)
value_matrix[2][1] = demandFunctionOne(11)
value_matrix[2][2] = demandFunctionOne(2011)

value_matrix[3][0] = 30
value_matrix[3][1] = 40
value_matrix[3][2] = 60

entropy_weights(value_matrix, 3, 4)
#weightVector()

for i in factorWeights:
    print(i)






