require 'airport'
require 'plane'
# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

describe Airport do
  it "instruct a plane to land at an airport" do
    subject {Airport.new}
  plane = Plane.new
  expect(subject.land(plane)).to eq "plane landed"
  end
# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  it "instruct a plane to take off and confirm it left" do
    airport = Airport.new
    expect(Airport.new.take_off).to eq "plane no longer in the airport"
  end

# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
describe Airport do
  it "prevents landing when the airport is full" do
    subject { Airport.new }
    plane = Plane.new
    Airport::DEFAULT_CAPACITY.times do
    subject.land(plane)
      end
      expect{ subject.land(plane) }.to raise_error 'Airport is full'
    end
  end


# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

it "has a default capacity" do
  expect(Airport.new.capacity).to eq Airport::DEFAULT_CAPACITY
end

end
