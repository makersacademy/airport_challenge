#As an air traffic controller
#So I can get passengers to a destination
# want to instruct a plane to land at an airport

require 'airport'
require 'plane'

describe AirportController do
    it { is_expected.to respond_to(:land).with(1).argument }

  #  As an air traffic controller
#  So I can get passengers on the way to their destination
#  I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it { is_expected.to respond_to(:take_off).with(1).argument}

  it "is expected to allow the planes to land" do
    plane = Plane.new
    expect(subject.land(plane)).to match_array([plane])
  end

  it "informs the AirportController that a plane has left the port" do
    plane = Plane.new
    expect(subject.take_off(plane)).to match_array([])
  end
end
