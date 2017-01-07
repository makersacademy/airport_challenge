require 'plane'

describe Plane do
  it "responds to the method 'land_plan'" do
    expect(subject).to respond_to(:land_plane)
  end
  it "responds to the method landed?" do
    expect(subject).to respond_to (:landed?)
  end
  it "confirms to ATC that it has landed" do
    plane = Plane.new
    plane.land_plane
    expect(plane.landed?).to eq true
  end
end
