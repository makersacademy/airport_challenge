require 'airport'

describe Airport do
  it 'harbours planes in airport' do
    weather = double(:weather, stormy?: false)
    plane = Plane.new
    expect(subject.land(weather, plane)).to eq [plane]
  end

  it 'lets planes take off from airport' do
    weather = double(:weather, stormy?: false)
    plane = Plane.new
    subject.land(weather, plane)
    expect(subject.takeoff(weather)).to eq plane
  end

  it 'is a plane down after plane has taken off' do
    weather = double(:weather, stormy?: false)
    plane = Plane.new
    subject.land(weather, plane)
    subject.takeoff(weather)
    expect(subject.confirm).to eq 0
  end

  it 'takeoff prevented when weather is stormy' do
    weather = double(:weather, stormy?: true)
    expect { subject.takeoff(weather) }.to raise_error 'Weather is stormy!'
  end

  it 'landing prevented when weather is stormy' do
    weather = double(:weather, stormy?: true)
    plane = Plane.new
    expect { subject.land(weather, plane) }.to raise_error 'Weather is stormy!'
  end

  it 'sets default capacity to 25' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'does not exceed default capacity' do
    Airport::DEFAULT_CAPACITY.times do
      weather = double(:weather, stormy?: false)
      subject.land(weather, Plane.new)
    end
    weather = double(:weather, stormy?: false)
    expect { subject.land(weather, Plane.new) }.to raise_error 'Airport full!'
  end
end
