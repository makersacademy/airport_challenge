# register of airports and planes

# airports
xja = Airport.new("XJA", 15)
khl = Airport.new("KHL", 25)
wtf = Airport.new("WTF", 30)
yep = Airport.new("YEP", 5)

# planes
za915 = Plane.new("ZA915", xja, khl)
za943 = Plane.new("ZA943", khl, xja)
zj754 = Plane.new("ZJ754", wtf, xja)
xj652 = Plane.new("XJ652", yep, xja)
