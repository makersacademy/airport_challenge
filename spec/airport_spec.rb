require './docs/airport.rb'

describe Airport do
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:landing).with(1).argument }
  it "creates a plane" do
    expect(subject).to respond_to(:create_planes)
  end
# one issue here is that h does not reset the orignal airport instance
# this is also not testing that h resets the @planes of the orignal airport instance.
# this test needs improving:

# This needs refactoring also
  it "the plane has left the airport instance once it has taken off" do
    airport = Airport.new
    plane1 = Plane.new
    h = airport.take_off(plane1)
    expect(h).to eq airport
  end
# didn't expect it to equal nil .. expect it to equal the airport object

end
