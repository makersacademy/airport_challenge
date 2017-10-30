require 'plane'
require 'airport'
require 'air_traffic_controller'
require 'weather'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
#
# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is
#no longer in the airport
#
# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
#
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

plane = Plane.new
airport = Airport.new

describe AirTrafficController do
  it "instructs plane to land at an airport" do
    allow(subject).to receive(:is_stormy?) { false }
    subject.instruct_to_land(plane, airport)
    expect(plane.has_landed?).to be true
  end
  it 'instructs a plane to take off from an airport' do
    allow(subject).to receive(:is_stormy?) { false }
    subject.instruct_to_take_off(plane, airport)
    expect(plane.has_taken_off).to be true
  end
  it 'confirms that the plane is no longer in the airport' do
    allow(subject).to receive(:is_stormy?) { false }
    expect(subject.instruct_to_take_off(plane, airport)).to eq true
  end
  it 'prevents plane from taking off if weather is stormy' do
    plane = Plane.new
    airport = Airport.new
    allow(subject).to receive(:is_stormy?) { true }
    subject.instruct_to_take_off(plane, airport)
    expect(plane.has_taken_off).to be false
  end
  it 'prevents plane from landing if weather is stormy' do
    allow(subject).to receive(:is_stormy?) { true }
  end
end
