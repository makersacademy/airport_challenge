#require 'capybara'- think this is only for http
require './lib/Plane'
require './lib/Airport'

# As an airtraffic controller I want to...

describe 'take off and land planes' do
#plane in air on way to airport - rework rspec
  it 'instruct a plane to take off from an airport and confirm that it is no longer in the airport
' do
    plane1 = Plane.new
    plane1.takeoff
    expect(plane1.landed). to eq false
  end

#Instruct a plane to land at an airport and confirm landing  - rework rspec
  it 'instruct a plane to land at an airport and confirm that it has landed ' do
    plane1 = Plane.new
    plane1.land
    #GET IT OUT OF ARRAY
    expect(plane1.landed). to eq true
  end
# Confirm that plane has landed at instructed airport
end

# #STORM COMES IN SO
# Prevent a plane from landing if it becomes stormy as plane is coming in
# Prevent a plane from taking off if it becomes stormy as plane is taxiing
# #STORM LIFTS SUN COMES OUT
# Instruct a plane to take off from an airport
# Confirm that it is no longer in the airport
# #AS MANY TIMES TO REACH capacity
# Instruct a plane to land at an airport
# Confirm that plane has landed at instructed airport
# #AIRPORT IS FULL
# Prevent a plane from landing if airport is full
# Instruct a plane to take off from an airport
# Confirm that it is no longer in the airport
# Instruct a plane to land at an airport
# Confirm that plane has landed at instructed airport
# #CHECK THAT ANOTHER PLANE CANNOT land
# Instruct a plane to land at an airport
# Confirm that plane has landed at instructed airport - expect error
# #CHANGE CAPACITY OF AIRPORT
# Aa an admin_System_designer I want to
# Set the capacity of a particular airport
# Instruct a plane to land at an airport
# Confirm that plane has landed at instructed airport
