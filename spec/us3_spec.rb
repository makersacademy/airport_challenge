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
    airport = Airport.new ("Test")
    expect(airport).to respond_to(:capacity)
    expect(airport.capacity).to eq(10)
  end

  it '- able to change the capacity of an airport' do
    airport = Airport.new('Test')
    airport.capacity = 1
    expect(airport.capatity).to eq(1)
  end
end

RSpec.describe Plane do
  it '- confirm unable to land plane at a full airport' do
    airport = instance_double("Airport", :capacity => 1)
    dummy_plane = plane.new
    test_plane = plane.new
    test_plane.location = "in_air"
    test_plane.destination = airport
    DblPlane = class_double("Plane", :list_all_planes => [dummy_plane])
    expect{subject.land}.to raise_error
  end
end
