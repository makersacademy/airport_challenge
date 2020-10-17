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
  it "- airport is able to respond to a request if it is full? " do
    expect(subject).to respond_to(:full?)
  end

  it "- airport is able to report full?" do
    expect(subject.full?).to be_falsey
    subject.capacity.times{
      Plane.new
      Plane.list_all_planes[-1].location = subject
    }
    expect(subject.full?).to be_truthy
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
