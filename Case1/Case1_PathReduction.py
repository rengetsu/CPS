def pathReduc(arr):
    start = 0
    directions = {"NORTH" : "SOUTH" , "SOUTH" : "NORTH" , "WEST" : "EAST" , "EAST" : "WEST"}

    if(len(arr) <= 1):
        return arr
    
    output = []
    
    while(start < len(arr)):
        move = arr[start]
        
        try:
            next_move = arr[start + 1]
        except IndexError:
            next_move = None
        
        if (next_move == directions[move]):
            start += 2
        else:
            output.append(move)
            start += 1
    
    if(len(output) == len(arr)):
        return output
    else:
        return pathReduc(output)

# test 1
# input: ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]
# output: ["WEST"]
#print(pathReduc(["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]))

# test 2
# input: ["NORTH", "SOUTH", "EAST", "WEST"]
# output: []
#print(pathReduc(["NORTH", "SOUTH", "EAST", "WEST"]))

# test 3
# input: ["NORTH", "WEST", "SOUTH", "EAST"]
# output: ["NORTH", "WEST", "SOUTH", "EAST"]
#print(pathReduc(["NORTH", "WEST", "SOUTH", "EAST"]))

# test 4 
# input: ["NORTH", "EAST", "WEST", "SOUTH", "WEST", "WEST"]
# output: ["WEST", "WEST"]
#print(pathReduc(["NORTH", "EAST", "WEST", "SOUTH", "WEST", "WEST"]))