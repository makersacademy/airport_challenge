require 'airport'
require 'plane'

RSpec.describe Airport do

  it "lands a plane at an airport" do
    plane = Plane.new
    expect(subject.land(plane)).to eq("Landed")
    expect(subject.hangar).to include(plane)
  end

end
