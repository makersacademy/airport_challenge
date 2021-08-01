# this file is used to run feature tests, most recent at the top, past tests follow 
require './lib/plane.rb'
require './lib/airport.rb'
# Couldn't understand how to implement the stub method in tests, so went for different solution
# # test 11 test that 
# plane = Plane.new
# heathrow = Airport.new([plane], 3)
# p heathrow
# test 10 planes can only take off from airports they have landed in
# heathrow = Airport.new([], 4)
# glasgow = Airport.new([], 4)
# plane1 = Plane.new
# plane2 = Plane.new
# heathrow.land(plane1)
# glasgow.land(plane2)
# p heathrow
# p glasgow
# p heathrow.take_off(plane2, 5) 
# test 9 prevent takeoff when weather argument is "stormy" passed to method take_off
# error is expected to be raised as take_off currently recieves one argument
# arr = []; 3.times {arr << Plane.new}
# boeing23 = arr[1]
# heathrow = Airport.new(arr, 4)
# p heathrow
# weather = "stormy"
# heathrow.take_off(boeing23, weather)
# p heathrow
# test 8 create capacity setting for instances of airport 
# arr = []; arr << Plane.new
# heathrow = Airport.new(arr, 1)
# test 7 raise error if airport is full (capcity is defaulted as 5 planes)
# arr = []; 5.times {arr << Plane.new}
# heathrow = Airport.new(arr)
# heathrow.land(Plane.new)
# test 6 remove instance of plane from instance variable in airport
# remove = Plane.new
# arr = []
# n = 0
# 5.times do 
#   if n == 2
#     remove = Plane.new
#     arr << remove
#   else
#     planes = Plane.new 
#     arr << planes
#   end
# end
# airport = Airport.new(arr)
# p airport
# p airport.take_off(remove)
# test 5 instruct airport to make plane take off
# @plane = [] 
# @plane << Plane.new
# @plane.take_off
# test 4: Land method can recieve argument
# p Airport.new.land(Plane.new)
# Test 3: respond to land method 
# p Airport.new.land
# Test 2: create instance of airport
# p airport = Airport.new
# Test1: create instance of plane
# p plane = Plane.new
