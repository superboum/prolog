import csv,sys,time,math,re

def slug(x): return re.sub('\W+', '', x[0].lower() + x[1:].replace(" ", ""))

counter = 0
places = []
merchandises = []
prices = {"buy": {}, "sell": {}}
for row in csv.reader(iter(sys.stdin.readline, '')):
  if counter == 0:
    places = [slug(x)  for x in row if len(x) > 0]
  elif counter == 1 :
    pass
  else:
    good = slug(row[0])
    merchandises.append(good)
    rpri = row[1:]
    for idx in range(len(rpri)):
      place = places[math.floor(idx / 2)]
      action = "buy" if idx % 2 == 0 else "sell"
      if place not in prices[action]: prices[action][place] = {}
      prices[action][place][good] = float(rpri[idx].replace(",", ".")) if len(rpri[idx]) > 0 else 0

  counter += 1

for merchandise in merchandises:
  print("merchandise(" + merchandise + ").")
print("")

for place in places:
  print("place(" + place + ").")
print("")

for action, v1 in prices.items():
  for place, v2 in v1.items():
    print("% "+place)
    for good, price in v2.items():
      if price == 0: continue
      print(action + "(" + place + ", " + good + ", " + str(price) + ").")
  print("")
