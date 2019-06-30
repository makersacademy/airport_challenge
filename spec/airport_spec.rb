require 'airport'

describe Airport do
  it 'harbours planes in airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'lets planes take off from airport' do
    weather = double(:weather, stormy?: false)
    plane = Plane.new
    subject.land(plane)
    expect(subject.takeoff(weather, plane)).to eq plane
  end

  it 'is a plane down after plane has taken off' do
    weather = double(:weather, stormy?: false)
    plane = Plane.new
    subject.land(plane)
    subject.takeoff(weather, plane)
    expect(subject.confirm(plane)).to eq 0
  end

  it 'takeoff prevented when weather is stormy' do
    weather = double(:weather, stormy?: true)
    plane = Plane.new
    expect{ subject.takeoff(weather, plane) }.to raise_error 'Weather is stormy!'
  end
end
