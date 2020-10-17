# this is a set of tests to run as a "Functional Test"
# testing the capabilities of the Air Traffic controller
require 'software_airport'
require 'class_world'

=begin
User story 5/6 -
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
=end

RSpec.describe Airport do

end

RSpec.describe Plane do
  it "- prevent plane landing if destination airport is stormy (US5)" do
    test_airport = Airport.new('TestUS5')
    allow(test_airport).to receive(:stormy?).and_return(true)
    test_plane = Plane.new
    test_plane.location = "in_air"
    test_plane.destination = test_airport
    expect { test_plane.land }.to output("Destination airport is stormy - abort landing\n").to_stdout
    expect(test_plane.location).to eq("in_air")
  end
end

RSpec.describe Plane do
  it "- prevent plane taking off if destination airport is stormy (US6)" do
    test_airport = Airport.new('TestUS6')
    allow(test_airport).to receive(:stormy?).and_return(true)
    test_plane = Plane.new
    test_plane.location = test_airport
    test_plane.destination = Airport.list_all_airports[0]
    expect { test_plane.take_off }.to output("Current airport is stormy - abort take off\n").to_stdout
    expect(test_plane.location).to eq(test_airport)
  end
end
