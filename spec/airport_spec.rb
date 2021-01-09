require 'airport'

describe Airport do

  it "should allow plane to land in airport" do
    plane = Plane.new
    expect(subject.land(plane)[0]).to eq(plane)
  end

  it "should allow plane to take off" do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).not_to include(plane)
  end
end
