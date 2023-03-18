from __future__ import division
import numpy as np
from mpl_toolkits.mplot3d import Axes3D  
# Axes3D import has side effects, it enables using projection='3d' in add_subplot
import matplotlib.pyplot as plt
from matplotlib import cm
import random

k, n, s, t = map(int, input().split())

inf = 10**20

mnx = inf
mxx = -inf
mny = inf
mxy = -inf
ans = inf

points = set()
for i in range(n):
    x, y = map(int, input().split())
    points.add((x,y))
    mnx = min(mnx, x)
    mxx = max(mxx, x)
    mny = min(mny, y)
    mxy = max(mxy, y)

count_peaks = 0

def fun(_x, _y):
    global ans
    global count_peaks
    ret = []
    print(len(_x))
    for x, y in zip(_x, _y):
        def get_cost(X, Y):
            global ans
            cost = 0
            cost += (X*X + Y*Y)**0.5*s
            dist = []
            for x1, y1 in points:
                dist.append(((X-x1)**2 + (Y-y1)**2)**0.5)
            dist = sorted(dist)
            ans = min(ans, cost + dist[k-1]*t)
            return cost + dist[k-1]*t
        cost_here = get_cost(x,y)
        ret.append(cost_here)
        def check_peak():
            is_peak = True
            dx = [ .5, -.5, 0., 0. ]
            dy = [ 0., 0., .5, -.5 ]
            for i in range(4):
                is_peak &= cost_here <= get_cost(x+dx[i], y+dy[i])
            global count_peaks
            count_peaks += is_peak
        check_peak() # comment out for significant speed up
    return ret

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
plt.axis([mnx - 5,mxx + 5,mny - 5,mxy + 5])
x = np.arange(mnx-5, mxx+5, (mxx-mnx+10)/100)
y = np.arange(mny-5, mxy+5, (mxy-mny+10)/100)
X, Y = np.meshgrid(x, y)
zs = np.array(fun(np.ravel(X), np.ravel(Y)))
Z = zs.reshape(X.shape)

surf = ax.plot_surface(X, Y, Z, cmap=cm.inferno, linewidth=0, antialiased=False)

ax.set_xlabel('X Label')
ax.set_ylabel('Y Label')
ax.set_zlabel('Z Label')

ax.invert_zaxis()

print(ans)
print("#peaks:", count_peaks)
fig.colorbar(surf, shrink=0.5, aspect=5)

plt.show()

