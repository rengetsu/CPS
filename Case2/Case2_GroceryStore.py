from collections import deque

def computeCheckoutTime(customers, n):
    queue = deque(customers)
    time = 0
    workers = [0 for _ in range(n)]

    while True:
        for i in range(n):
            if workers[i] == 0:
                if queue:
                    workers[i] = queue.popleft()
            if workers[i] > 0:
                workers[i] -= 1
        if queue or any([w > 0 for w in workers]):
            time += 1
        else:
            break
    return time+1

# test 1
# input: ([5,3,4], 1)
# output: 12
#print(computeCheckoutTime([5,3,4], 1))

# test 2
# input: ([10,2,3,3], 2)
# output: 10
#print(computeCheckoutTime([10,2,3,3], 2))

# test 3
# input: ([2,3,10], 2)
# output: 12
#print(computeCheckoutTime([2,3,10], 2))

# test 4
# input: ([2,2,3,3,4,4], 2)
# output: 9
#print(computeCheckoutTime([2,2,3,3,4,4], 2))