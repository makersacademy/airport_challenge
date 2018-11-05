require 'plane'
describe Plane do
  let(:plane) {plane = Plane.new}
  it "plane object created" do
    expect(plane.instance_of? Plane).to eq true
  end
  it "plane is defaulted to landed" do
    expect(plane.status).to eq "landed"
  end
end
