require './lib/airport.rb'

x = Airport.new(20)
x.landing(1)
x.landing(3)
x.landing(5)
x.landing("nug")
x.landing(4)
p x.landing(4)
x.landing(13)
p x.take_off("nug")
x.take_off(8)
