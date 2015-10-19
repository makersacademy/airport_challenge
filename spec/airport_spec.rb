require 'airport'

describe Airport do
  let (:plane) {Plane.new}
  let (:airport) {Airpot.new}

  it 'allows for a plane to land' do
    expect(subject).to respond_to(:land)
  end

  it 'allows for a plane to take off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'checks that a plane is removed from airport when it takes off' do
    allow(plane).to receive(:ground?).and_return(false)
    allow(subject.weather).to receive(:stormy?).and_return(false)
    subject.land(plane)
    expect{subject.take_off(plane)}.to change {subject.planes.length}.by(-1)
  end

  it 'raises an error when the airport is at full capacity' do
    allow(plane).to receive(:ground?).and_return(false)
    allow(subject.weather).to receive(:stormy?).and_return(false)
    subject.capacity.times{subject.land(plane)}
    expect{subject.land(Plane.new)}.to raise_error("the airport is full")
  end

  describe '#initialize' do
    it 'check that capacity is default if not set'  do
      airport = Airport.new()
      expect(airport.capacity).to eq 50
    end

    it 'check that capacity can be changed'  do
     airport = Airport.new(25)
     expect(airport.capacity).to eq 25
    end
  end

  it 'raises an error if grounded plane instructed to land' do
    plane1 = Plane.new
    plane.ground?
    expect{subject.land(plane1)}.to raise_error("plane is already grounded")
  end

  it 'raises an error if flying plane instructed to take off' do
    allow(plane).to receive(:flying?).and_return(true)
    #  subject.take_off(plane)
    expect{subject.take_off(plane)}.to raise_error("plane is already flying")
  end

  it 'raises an error if take off in bad weather' do
    allow(plane).to receive(:ground?).and_return(false)
    subject.land(plane)
    allow(subject.weather).to receive(:stormy?).and_return(true)
    expect{subject.take_off(plane)}.to raise_error("cannot take off in a storm")
  end

  it 'raises an error if land in bad weather' do
    allow(plane).to receive(:ground?).and_return(false)
    allow(subject.weather).to receive(:stormy?).and_return(true)
    expect{subject.land(plane)}.to raise_error("cannot land in a storm")
  end
 end
