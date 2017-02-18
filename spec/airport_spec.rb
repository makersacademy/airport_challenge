require 'airport'
require 'plane'

describe Airport do

  it "is initialized with an empty array of planes" do
    expect(subject.planes).to eq []
  end

  it "can keep track of a plane that has landed" do
    plane = Plane.new
    plane.land(subject)
    expect(subject.planes).to eq [plane]
  end

end
