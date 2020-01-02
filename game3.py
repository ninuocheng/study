import random
choices = ['石头','剪刀','布']
computer = random.choice(choices)
# player = input('请出拳(石头/剪刀/布):')
prompt = '''(0)石头
(1)剪刀
(2)布
请选择(0/1/2):'''
ind = int(input(prompt))
player = choices[ind]
print('Your choice:%s,couputer choice:%s' % (player,computer))
win_list = [['石头','剪刀'],['剪刀','布'],['布','石头']]
if player == computer:
    print('\033[32;1m平局\033[0m')
elif [player, computer] in win_list:
    print('\033[31;1mYou WIN!!!\033[0m')
else:
    print('\033[31;1mYou Lose!!!\033[0m')