from math import sqrt,atan2
class Point:
    def __init__(self,x,y):
        self.x = x
        self.y = y
    def dist(self):
        return sqrt(self.x**2 + self.y**2)
    def __add__(self, other):
        return Point(self.x + other.x, self.y + other.y)
    def __sub__(self, other):
        return Point(self.x - other.x, self.y - other.y)
    def __mul__(self, other):
        return Point(self.x * other, self.y * other)
    def __truediv__(self,other):
        return Point(self.x/other,self.y/other)
    def __eq__(self,other):
        return self.x == other.x and self.y == other.y
    def __hash__(self):
        return hash((self.x,self.y))
    def perp(self):
        return Point(-self.y,self.x)
    def unit(self):
        return self/self.dist()
    def angle(self):
        return atan2(self.y, self.x)
