require './lib/air_traffic.rb'
require './lib/plane.rb'
require './lib/airport.rb'

traffic = AirTraffic.new
xja = Airport.new("XJA", 15)
khl = Airport.new("KHL", 25)
wtf = Airport.new("WTF", 30)
za915 = Plane.new("ZA915", xja, khl)
za943 = Plane.new("ZA943", khl, xja)
zj754 = Plane.new("ZJ754", wtf, xja)

puts xja.code
puts khl.code
puts wtf.code
puts za915.callsign
puts za943.callsign
puts zj754.callsign

traffic.takeoff(za915, khl)
puts traffic.interrogate(za915)
puts traffic.interrogate(zj754)
