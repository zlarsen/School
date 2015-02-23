def TOH(disc):
  a = range(1,disc+1)
  a.reverse()
  b = []
  c = []
  curr = 3
  for i in range(2**disc):
    if curr == 3:
      if legal(a,b):
        temp = a.pop(len(a)-1)
        b.append(temp)
        print "Move", temp, "from A to B"
      elif legal(b,a):
        temp = b.pop(len(b)-1)
        a.append(temp)
        print "Move", temp, "from B to A"
    elif curr == 2:
      if legal(a,c):
        temp = a.pop(len(a)-1)
        c.append(temp)
        print "Move", temp, "from A to C"
      elif legal(c,a):
        temp = c.pop(len(c)-1)
        a.append(temp)
        print "Move", temp, "from C to A"
    elif curr == 1:
      if legal(b,c):
        temp = b.pop(len(b)-1)
        c.append(temp)
        print "Move", temp, "from B to C"
      elif legal(c,b):
        temp = c.pop(len(c)-1)
        b.append(temp)
        print "Move", temp, "from C to B"
    if curr == 3:
      curr = 2
    elif curr == 2:
      curr = 1
    else:
      curr = 3
  return

def legal(start, end):
  if len(start) == 0:
    return False
  elif len(end) == 0:
    return True
  a_top = start[len(start)-1]
  z_top = end[len(end)-1]
  if a_top > z_top:
    return False
  elif z_top > a_top:
    return True

def main():

  TOH(5)
  return

main()