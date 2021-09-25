require 'plane'

describe Plane do
  plane = Plane.new
  it "creates plane objects" do
    expect(plane).to be_instance_of(Plane)
  end
  it "knows it's current airport" do
    expect(plane).to respond_to(:current_airport)
  end
end