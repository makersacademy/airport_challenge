require 'airport'

describe Airport do
  it "Checks if plane lands on an airport" do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end
end
