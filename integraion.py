from sympy import S, integrate
x = S('x')
a = S('a')
b = S('b')
f = a+b*(x**3)
a_par = float(input("a: "))
b_par = float(input("b: "))
start = float(input("start: "))
end = float(input("end: "))
f = f.subs({a:a_par, b:b_par})
res = integrate(f, (x, start, end))
print(res)