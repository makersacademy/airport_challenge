require 'plane'
describe Plane do
  it "plane object created" do
    plane = Plane.new
    expect(plane.instance_of? Plane).to eq true
  end
end
