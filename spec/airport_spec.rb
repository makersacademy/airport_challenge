require 'airport'

describe Airport do
  it 'harbours planes in airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'lets planes take off from airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.takeoff(plane)).to be plane
  end

  it 'is a plane down after plane has taken off' do
    plane = Plane.new
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.confirm(plane)).to eq 0
  end
end
