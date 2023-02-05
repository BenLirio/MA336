from functools import lru_cache

def num_partitions(n):
    @lru_cache(maxsize=None)
    def aux(x, y):
        if x == 0 and y == 0:
            return 1
        if y == 0:
            return aux(x-1, x-1)
        return aux(x,y-1)+aux(x-1,y-1)
    return aux(n,n)



if __name__ == '__main__':
    i = 0
    while True:
        print(f"{i}: {num_partitions(i)}")
        i += 1
