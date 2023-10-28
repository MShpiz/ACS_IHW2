from sympy import S, integrate

def intgr(a_par, b_par, start, end):
  x = S('x')
  a = S('a')
  b = S('b')
  f = a+b*(x**3)
  f = f.subs({a:a_par, b:b_par})
  res = integrate(f, (x, start, end))
  print(res)

arguments = [
    [10.0,	10.0,	0.0, 0.0],
    [0.0,	0.0,	0.0,	1.0],
    [10.0,	0.0,	0.0,	1.0],
    [1.0,	1.0,	0.0,	1.0],
    [1.0,	1.0,	1.0,	0.0],
    [0.0,	1.0,	0.0,	1.0],
    [0.0,	1.0, -1.0,	0.0],
    [0.0, 1.0,	-1.0,	1.0],
    [	100.0,	-150.0,	-0.13,	0.12],
    [0.0, 0.00001,	1000.0, 1001.0],
]

for i,arg in enumerate(arguments):
  print(f'test {i+1}')
  print(f'a: {arg[0]}')
  print(f'b: {arg[1]}')
  print(f'start: {arg[2]}')
  print(f'end: {arg[3]}')
  print(f'result: ', end='')
  intgr(*arg)
  print()