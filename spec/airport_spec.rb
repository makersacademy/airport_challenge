require 'airport'

describe Airport do
  it 'should instruct a plane to land' do
    allow(subject.weather).to receive(:stormy?).and_return false
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it 'should instruct a plane to take off' do
    allow(subject.weather).to receive(:stormy?).and_return(false, false)
    plane = Plane.new
    allow(plane).to receive(:flying).and_return(true, false)
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it 'should prevent planes landiing when full' do
    a = Airport.new(1)
    allow(a.weather).to receive(:stormy?).and_return(false)
    pl = Plane.new
    a.land(pl)
    message = 'Airport is full'
    expect{a.land(Plane.new)}.to raise_error(message)
  end

  it 'should prevent planes from landing when weather is stormy' do
    allow(subject.weather).to receive(:stormy?).and_return(true)
    message = 'Weather is stormy'
    expect{subject.land(Plane.new)}.to raise_error(message)
  end

  it 'should prevent planes from taking off when the weather is stormy' do
    allow(subject.weather).to receive(:stormy?).and_return(false, true)
    pl = Plane.new
    subject.land(pl)
    message = 'Weather is stormy'
    expect{subject.take_off(pl)}.to raise_error(message)
  end

  it 'should only allow planes to take off if they are in airport' do
    allow(subject.weather).to receive(:stormy?).and_return(false)
    pl = Plane.new
    expect { subject.take_off(pl) }.to raise_error('The plane is not in this airport')
  end

  it 'should have a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
end