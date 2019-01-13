require "airport"

describe Airport do
  it "will respond to confirmation method" do
    expect(subject).to respond_to(:confirmation?)
  end

  it "checks  if a plane can land" do
    plane = Airport.new
    subject.land(plane)
    expect(subject.planes.include?(plane)).to eq(true)
  end

  it "can instruct a PLANE to LAND" do
    expect(subject).to respond_to(:land).with(1).arguments
  end

  # expect(subject.departd.to eq

  # airplane  = Airplane.new
  # airlane.depart?
  # it "will initialize airport with capacity of 1"
  # airport = Airport.new(1)
  # airport.instance_variable_set(:@planes, 1)
end
#
#
#
