require "airport.rb"
require "plane.rb"

describe "user_stories" do

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
# and confirm that it has landed

it "airport can instruct a plane to land" do
  airport = Airport.new(50)
  plane = Plane.new
  expect { airport.land(plane) }.not_to raise_error
end

it "airport can confirm that a plane has landed" do
  airport = Airport.new(50)
  plane = Plane.new
  expect { airport.confirm_land(plane) }.not_to raise_error
end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport
# and confirm that it is no longer in the airport

it "airport can instruct a plane to take off" do
  airport = Airport.new(50)
  plane = Plane.new
  expect { airport.take_off(plane) }.not_to raise_error
end

it "airport can confirm that a plane is no longer in the airport" do
  airport = Airport.new(50)
  plane = Plane.new
  expect { airport.confirm_take_off(plane) }.not_to raise_error
end
# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy

# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

it "airport prevents plane from landing when airport is full" do
  airport = Airport.new(50)
  plane = Plane.new
  50.times do
    airport.land(plane)
  end
  expect { airport.land(plane) }.to raise_error "can't land plane, airport is full"
end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

end
