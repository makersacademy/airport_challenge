require 'plane'

describe Plane do
  it "should be in flying status when plane takes off" do
    expect(subject.flying).to eq true
  end

  it "should not be able to land if already landed" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect { airport.land(plane) }.to raise_error "Cannot land - plane is already landed"
  end
end
