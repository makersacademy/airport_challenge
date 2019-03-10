require 'airport'
require 'plane'

RSpec.describe Airport do

  let(:plane) { Plane.new }

  it "lands a plane at an airport" do
    expect(subject.land(plane)).to eq("Landed")
    expect(subject.hangar).to include(plane)
  end

  it "instructs the plane to take_off and confirm it has taken off" do
    expect(subject.take_off(plane)).to eq("Plane has taken off")
  end

end
