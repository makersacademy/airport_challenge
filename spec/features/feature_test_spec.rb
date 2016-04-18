

# User Story 1

require_relative '../../lib/airport.rb'
describe 'features' do
  context 'User Story 1'  do
    it 'instruct plane to land at airport' do
        heathrow = Airport.new
        plane = Plane.new
        heathrow.allow_land(plane)
        # plane.at_airport?
        expect(heathrow.planes_in_airport).to include plane
      end
  end
  context 'User Story 2' do
    it 'instruct plane to take off from airport' do
      # heathrow = Airport.new
      # plane = Plane.new
      # # plane.at_airport? #plane not at airportgit
      # # heathrow.take_off(plane) #raise error, no plane to take of f
      # heathrow.land(plane)#plane added to airport
      # # plane.at_airport? #plane at airport
      # heathrow.take_off(plane)#plane can leave
      # expect(heathrow.planes_in_airport).not_to include plane
    end
  end
  context 'User Story 3' do
    it 'prevents plane from taking off during stormy weather' do

    end
  end
  context 'User Story 4' do
    it 'prevents plane from landing at airport during stormy weather' do

    end
  end
  context 'User Story 5' do
    it 'prevents landing when airport is full' do

    end
  end
  context 'User Story 6' do
    it 'sets defualt capacity of airport' do

    end
    it 'changes capacity of airport' do

    end
  end
end





#
# # User story 2
# require './lib/airport.rb'
# require './lib/plane.rb'
# heathrow = Airport.new
# plane = Plane.new
# plane.at_airport? #plane not at airport
# heathrow.take_off(plane) #raise error, no plane to take of f
# heathrow.land(plane)#plane added to airport
# plane.at_airport? #plane at airport
# heathrow.take_off(plane)#plane can leave
# plane.at_airport? #plane not at airport
# #
# # #Extra tests, for one plane -> []
# # # last plane of many -> .pop
# # # plane in middle -> .delete(plane)
# #
# #User story 3
# require './lib/airport.rb'
# require './lib/plane.rb'
# heathrow = Airport.new
# 20. times do
#   20.times do
#     plane = Plane.new
#     heathrow.land(plane)
#     heathrow.take_off(plane)
#     p plane.at_airport?
#   end
# end
# #Random chance of take off
# #error if bad weather
# #take off
#
# #User story 4
# require './lib/airport.rb'
# require './lib/plane.rb'
# heathrow = Airport.new
#
# 20.times do
#   plane = Plane.new
#   heathrow.land(plane)
#   p plane.at_airport?
# end
#
# #User story 5
# #cap = 10
# require './lib/airport.rb'
# require './lib/plane.rb'
# heathrow = Airport.new
# 20.times do
#   plane = Plane.new
#   heathrow.land(plane)
#   p plane.at_airport?
# end
# plane = Plane.new
# heathrow.land(plane) #error
#
# #User story 6
# require './lib/airport.rb'
# require './lib/plane.rb'
# capacity = 10
# heathrow = Airport.new (capacity)
# capacity.times do
#   plane = Plane.new
#   heathrow.land(plane)
#   p plane.at_airport?
# end
# plane = Plane.new
# heathrow.land(plane) #error
