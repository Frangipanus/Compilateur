def make_list(n,v):
    if (n== 0):
        return []
    else:
        return ([v]+make_list(n-1,v))
def set(l, i, v):
    l[i] = v 
    return l
def get(l,i):
    return l[i]

def cycle(n):
    c = make_list(n,0)
    for i in range(0,n):
        c = set(c,i,(i+1)%n)
    return c 
def josephus(n,p):
    c = cycle(n)
    i = 0
    while(get(c,i)!=i):
        for _ in range(1,p-1):
            print(i)
            i = get(c,i)
            print(i)
        c = set(c,i,get(c,get(c,i)))
        i = get(c,i)
    return i + 1
print(josephus(13,2))
    