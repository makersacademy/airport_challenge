require 'plane'

describe Plane do
  it "lands at airport without error" do
    expect { subject.land_at(Airport.new) }.not_to raise_error
  end
  it "expects the plane to be in the hanger" do
    airport = Airport.new
    subject.land_at(airport)
    expect(airport.hanger).to eq [subject]
  end
end
