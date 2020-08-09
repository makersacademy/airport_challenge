# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

require 'airport'
describe Airport do
  it "Expects Airport to respond to landing a plane" do
    expect(subject).to respond_to(:land)
  end

  it "Expects a plane to land at airport" do
    airport = Airport.new
    plane = Plane.new
    subject.land(plane)
    expect(airport.land(plane)).to eq([plane])
  end

  it "Expects Airport to respond_to take_off method" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "Expects a plane to take off from the airport" do
    airport = Airport.new
    plane = Plane.new
    subject.take_off(plane)
    expect(airport.take_off(plane)).to eq(plane)
  end

end
