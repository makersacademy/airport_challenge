require './lib/Plane'

describe Plane do
  it "Creates plane instances" do
    expect(Plane.new).to be_instance_of Plane
  end
  it "Plane responds to land" do
    expect(subject).to respond_to(:land)
  end
  it "Plane responds to take_off" do
    expect(subject).to respond_to(:take_off)
  end
  it "Confirm the plane has left the airport" do
    expect(subject.take_off).to eq true
  end
end
