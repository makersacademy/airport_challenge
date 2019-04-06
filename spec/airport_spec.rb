require 'airport'

describe Airport do
  it "empty the hanger" do
    plane = Plane.new
    plane.land_at(subject)
    subject.take_off(plane)
    expect(subject.hanger).to eq []
  end
  it "release the correct plane from the hanger" do
    plane = Plane.new
    plane2 = Plane.new
    plane.land_at(subject)
    plane2.land_at(subject)
    subject.take_off(plane)
    expect(subject.hanger).to eq [plane2]
  end
end
