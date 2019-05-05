require 'airport'
require 'plane'

describe Airport do
  it "should store landed planes" do
    planes = Plane.new
    planes.land(subject)
    expect(subject.planes.include?(planes)).to eq(true)
  end
end
