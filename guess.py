import random
num = random.randint(1,100)
counter = 0
while counter < 7:
    answer = int(input('guess:'))
    if answer > num:
        print('猜大了')
    elif answer < num:
        print('猜小了')
    else:
        print('猜对了')
        break
    counter += 1
else:
    print('正确答案:',num)