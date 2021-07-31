# this file is used to run feature tests, most recent at the top. 
require './lib/plane.rb'
require './lib/airport.rb'


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
#p Airport.new.land(Plane.new)

#Test 3: respond to land method 
#p Airport.new.land

#Test 2: create instance of airport
# p airport = Airport.new

#Test1: create instance of plane
# p plane = Plane.new
