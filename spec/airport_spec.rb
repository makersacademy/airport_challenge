require 'airport'
require 'plane'
describe Airport do
  it "should store landed planes" do
    plane = Plane.new
    plane.land(subject)
    expect(subject.stored_planes).to eq [plane]
  end
  it "should not store a landed plane after take off" do
    plane = Plane.new
    plane.land(subject)
    plane.take_off(subject)
    expect(subject.stored_planes).to eq []
  end
end
