# this is a set of tests to run as a "Functional Test"
# testing the capabilities of the Air Traffic controller
require 'software_airport'

=begin
User story 3 -
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
=end

RSpec.describe Airport do
  it '- confirm capacity is an attribute (and equal to default)' do
    airport = Airport.new("Test")
    expect(airport).to respond_to(:capacity)
    expect(airport.capacity).to eq(10)
  end

  it '- able to change the capacity of an airport' do
    airport = Airport.new('Test')
    airport.capacity = 1
    expect(airport.capacity).to eq(1)
  end
end

RSpec.describe Plane do
  it '- confirm unable to land plane at a full airport' do
    airport = Airport.new('Test1', 1)
    dummy_plane = Plane.new
    dummy_plane.location = airport
    test_plane = Plane.new
    test_plane.location = "in_air"
    test_plane.destination = airport
    expect(test_plane.land).to eq(false)
  end
  it '- confirm able to land plane at airport with space' do
    airport = Airport.new('Test1', 1)
    test_plane = Plane.new
    test_plane.location = "in_air"
    test_plane.destination = airport
    test_plane.land
    expect(test_plane.location).to eq(airport)
  end
end
