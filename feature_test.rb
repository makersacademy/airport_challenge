require './docs/airport.rb'

airport = Airport.new
airport.create_planes
plane2 = airport.create_planes
h = airport.take_off(plane2)
#here the planes have only been removed from the h instance of airport not the
#orignial airport array so when airport is tested the orignal planes are still in it.

#also in h it deleted the whole array instead of just one plane .. May have to be
#a hash not an array?
