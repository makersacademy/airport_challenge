require 'plane'

describe Plane do
  it "lands at an airport" do
    airport = Airport.new
    expect(subject.land_at(airport)).to eq(airport)
  end

  it "takes off from airport" do
    expect(subject.take_off).to eq("In the air.")
  end
end
