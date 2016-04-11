import sys
import json

def iterate(obj):
    if isinstance(obj, list):
        return enumerate(obj)

    if isinstance(obj, dict):
        return obj.iteritems()

filterpath = sys.argv[1:]

def check_filter(path):
    lpath = 0
    try:
        for c in filterpath:
            if c[0] == "-":
                mode = "substract"
                c = c[1:]
            else: mode = "std"
            if mode == "substract":
                if c in path[lpath:]: return False
            else:
                idx = path[lpath:].index(c)
                lpath = idx
        return True
    except ValueError:
        return False

def inspect(obj,path=[]):
    values = []
    for k,v in iterate(obj):
        newpath = path + [str(k)]
        if isinstance(v, list) or isinstance(v, dict):
            values += inspect(v, newpath)
        else:
            if check_filter(newpath):
                values += [(newpath , v)]
    return values


text = sys.stdin.read()

jobj = json.loads(text)

res = inspect(jobj)

for k, v in res:
    print ".".join(k) + "\t" + str(v)
#ret = eval("jobj" + sys.argv[1])

#new_text = json.dumps(ret,indent=4)

#print new_text
#y[0]["NetworkSettings"]["IPAddress"]
