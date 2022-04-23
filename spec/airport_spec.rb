require './lib/airport'
require './lib/weather'

describe Airport do
  # Lands a plane
  it 'responds to method land' do
    expect(subject).to respond_to :land
  end

  it '#land accepts one argument' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it '#land lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq subject.planes
  end

  it 'rasies an error when airport is full' do
    subject.capacity.times {subject.land(Plane.new)}
    expect {subject.land(Plane.new)}.to raise_error 'Airport full'
  end

  # Capacity
  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'allows to set capacity' do
    airport = Airport.new(10)
    expect(airport.capacity).to eq 10
  end

  # Takes off a plane
  it 'responds to the take_off method' do
    expect(subject).to respond_to :take_off
  end

  it '#take_off accepts one argument' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it '#take_off takes-off the plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it 'confirms the plane has left the airport' do
    plane = Plane.new
    subject.land(plane)
    #expect(plane.left_airport?).to eq true
    expect(subject.take_off(plane)).to be_left_airport
  end

  describe '#take_off' do
    it 'raises an error when the weather is stormy' do
      plane = Plane.new
      subject.land(plane)
      weather = double(:weather)
      allow(weather).to receive(:stormy?).and_return(true)
      expect{ subject.take_off(plane) }.to raise_error 'Take-off not allowed due to adverse weather'
    end
  end 

end