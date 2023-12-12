import numpy as np
from numpy import arange,sin,pi
import matplotlib.pyplot as plt
#def seno(z):
#    return np.sin(z)
#a=0
#b=2*np.pi
#esp=30
#x=np.linspace(a,b,int(360/esp+1)) #van a ser 13 punto para lograr 13 internalos equidistantes
#f=seno(x)
#plt.plot(x,f)
#plt.plot(x,f,"o")
#plt.grid(True)
#plt.show
x=arange(0.0,2*pi,0.01)
y=sin(x)
f =np.fft.fft(y)

plt.plot(x,y)
plt.grid(True)
plt.ylabel("Y")
plt.xlabel("X")
plt.show()