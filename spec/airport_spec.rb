require 'airport'

describe Airport do
  it 'can create an instance of itself' do
    expect(subject).to be_kind_of(Airport)
  end

  it 'it responds to a land method - enabling flights to land' do 
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'responds to a method take off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'raises an error if a plane that never lands in aiport tries to  take off' do
    airport1 = Airport.new
    airport2 = Airport.new
    plane1 = Plane.new
    plane2 = Plane.new
    allow(subject.weatherInst).to receive(:stormy?).and_return(false)
    airport1.land(plane1)
    allow(subject.weatherInst).to receive(:stormy?).and_return(true)
    airport2.land(plane2)
    expect{airport2.take_off(plane1)}.to raise_error "Plane not in airport, so can't take off" 
  end

  it 'raises an error when planes from landing if aiport is full (ie. at capacity)' do
    11.times {allow(subject.weatherInst).to receive(:stormy?).and_return(false)}
    11.times {subject.land(Plane.new)}
    allow(subject.weatherInst).to receive(:stormy?).and_return(false)
    expect{subject.land(Plane.new)}.to raise_error "Airport is full"
  end

  it 'when initialized a deafult capacity exists' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'can over-ride the default capacity if wanted' do
    airport = Airport.new(20) 
    expect(airport.capacity).to eq 20
  end

  it 'cannot have the same plane land twice' do
    plane1 = Plane.new
    subject.land(plane1)
    expect{subject.land(plane1)}.to raise_error "Plane already laneded"
  end

  it 'prevents takeoff when weather is stormy' do
    plane = Plane.new
    subject.land(plane)
    allow(subject.weatherInst).to receive(:stormy?).and_return(true)
    expect{subject.take_off(plane)}.to raise_error "Stormy weather conditions, can't take off"
  end

  it 'prevents landing when weather is stormy' do
    plane = Plane.new
    allow(subject.weatherInst).to receive(:stormy?).and_return(true)
    expect{subject.land(plane)}.to raise_error "Stormy weather conditions, can't land"
  end

end