# WEEKEND 1 CHALLENGE - Airport
#
# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
#
# PASSENGER			TO DESTINATION
# PLANE				TO LAND
# AIRPORT
# ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.
#
#
# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
#
# PASSENGER			WAY TO DESTINATION
# PLANE				TO TAKE OFF / NO LONGER AT AIRPORT
# AIRPORT
#
#
# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy
#
# RANDOM NUMBER GENERATOR TO SET THE WEATHER, NORMALLY SUNNY, RARE OCCASION STORMY
# you'll need to use a stub to override random weather to ensure consistent test behaviour
# https://www.relishapp.com/rspec/rspec-mocks/docs 
#
# WEATHER IS STORMY		NO TAKE OFF
#
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy
#
# WEATHER IS STORMING		NO LANDING
#
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
#
# AIRPORT FULL 			NO LANDING
#
#
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate
#
# CUSTOMISED DEFAULT AIRPORT CAPACITY

require 'plane'

describe Plane do
  it { is_expected.to respond_to(:landed) }
  it { is_expected.to respond_to(:flying) }

  it 'custom landed' do
    plane = Plane.new
    plane.landed = true
    expect(plane.landed).to eq true
  end

  it 'custom landed' do
    plane = Plane.new
    plane.flying = true
    expect(plane.flying).to eq true
  end
end
