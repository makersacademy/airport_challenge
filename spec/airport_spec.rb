require './lib/airport'

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
    expect(subject.land(plane)).to eq plane
  end

  it 'rasies an error when airport is full' do
    subject.capacity.times {subject.land(Plane.new)}
    expect {subject.land(Plane.new)}.to raise_error 'Airport full'
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
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
    expect(subject.take_off(plane)).to eq plane
  end

  it 'confirms the plane has left the airport' do
    plane = subject.take_off(Plane.new)
    #expect(plane.left_airport?).to eq true
    expect(plane).to be_left_airport
  end

end