result = 0
counter = 0
while counter < 100:
    counter += 1
    if counter % 2:
        continue
    result += counter
print(result)