require "Airport"

describe Airport do
  describe "#plane_landed" do
  airport = Airport.new
  plane = airport.land
  it { expect(subject.land).to be_a Plane }
end
end
