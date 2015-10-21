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

  it 'should prevent planes from landing when full' do
    heathrow = Airport.new(1)
    allow(heathrow.weather).to receive(:stormy?).and_return(false)
    boeing = Plane.new
    heathrow.land(boeing)
    message = 'Airport is full'
    expect{heathrow.land(Plane.new)}.to raise_error(message)
  end

  it 'should prevent planes from landing when weather is stormy' do
    allow(subject.weather).to receive(:stormy?).and_return(true)
    message = 'Weather is stormy'
    expect{subject.land(Plane.new)}.to raise_error(message)
  end

  it 'should prevent planes from taking off when the weather is stormy' do
    allow(subject.weather).to receive(:stormy?).and_return(false, true)
    boeing = Plane.new
    subject.land(boeing)
    message = 'Weather is stormy'
    expect{subject.take_off(boeing)}.to raise_error(message)
  end

  it 'should only allow planes to take off if they are in airport' do
    allow(subject.weather).to receive(:stormy?).and_return(false)
    boeing = Plane.new
    expect { subject.take_off(boeing) }.to raise_error('The plane is not in this airport')
  end

  it 'should have a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
end
