require 'plane'
describe Plane do
  # describe "a plane lands at an airport" do
  it "should land at an airport" do
    plane = Plane.new
    expect(plane.land(plane)).to eq plane
  end
end
# end
