fib = [0,1]
n = int(input('长度:'))
for i in range(n-2):
    a = fib[-2]+fib[-1]
    fib.append(a)
print(fib)