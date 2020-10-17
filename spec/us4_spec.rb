# this is a set of tests to run as a "Functional Test"
# testing the capabilities of the Air Traffic controller
require 'software_airport'
require 'class_world'

=begin
User story 4 -
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
=end

RSpec.describe Plane do
  it "- clear all planes from Class" do
    expect { Plane.clear_all_planes }.to change{Plane.list_all_planes.count}.to(0)
  end

end

RSpec.describe Airport do
  it "- clears all airports from Class" do
    expect { Airport.clear_all_airports }.to change {Airport.list_all_airports.count}.to(0)
  end

  it '- confirm capacity is an attribute (and equal to default)' do
    airport = Airport.new("Test")
    expect(airport).to respond_to(:capacity)
    expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  it '- able to change the capacity of an airport' do
    airport = Airport.new('Test')
    airport.capacity = 1
    expect(airport.capacity).to eq(1)
  end
end
