require 'plane'
describe Plane do
  it "lands at an airport" do
    plane = Plane.new
    expect(plane.land).to eq "plane has landed"
  end
end
