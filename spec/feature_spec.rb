# this file is used to run feature tests, most recent at the top. 
require './lib/plane.rb'
require './lib/airport.rb'


# test 6: Make sure we can land and remove multiple plane instances 
arr  = []
x = 0
5.times do 
  if x == 2 
    @remove = Plane.new
    p @remove
    arr << @remove
  else
    plane = Plane.new
    arr << plane 
  end
  x += 1
end 
p arr
p @remove

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
