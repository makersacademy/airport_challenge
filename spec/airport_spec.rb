require 'airport'
require 'plane'

describe Airport do

  it 'recieves a plane when one lands' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'confirms the plane has taken off and is not in the airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq plane
  end
end
