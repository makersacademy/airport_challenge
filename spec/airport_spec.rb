require './lib/airport'
require './lib/weather'

describe Airport do

  # Capacity
  describe '#capacity' do

    it 'has a default value' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'can be set to a specific value' do
      airport = Airport.new(10)
      expect(airport.capacity).to eq 10
    end

  end

  # Lands a plane
  describe '#land' do

    it 'airport responds to the method' do
      expect(subject).to respond_to :land
    end

    it 'accepts one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'lands a plane' do
      plane = double (:plane)
      expect(subject.land(plane)).to eq subject.planes
    end

    it 'rasies an error when airport is full' do
      plane = double (:plane)
      subject.capacity.times {subject.land(plane)}
      expect {subject.land(plane)}.to raise_error 'Airport full'
    end

  end

  # Takes off a plane
  describe '#take_off' do

    it 'airport responds to the method' do
      expect(subject).to respond_to :take_off
    end

    it 'accepts one argument' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'raises an error when the weather is stormy' do
      plane = double (:plane)
      subject.land(plane)
      weather = class_double('Weather').as_stubbed_const
      allow(weather).to receive(:stormy?).and_return(true)
      expect{ subject.take_off(plane) }.to raise_error 'Take-off not allowed due to adverse weather'
    end

    it 'takes-off the plane when the weather is NOT stormy' do
      plane = double (:plane)
      subject.land(plane)
      weather = class_double('Weather').as_stubbed_const
      allow(weather).to receive(:stormy?).and_return(false)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'confirms the plane has left the airport' do
      plane = double (:plane)
      allow(plane).to receive(:left_airport?).and_return(true)
      subject.land(plane)
      weather = class_double('Weather').as_stubbed_const
      allow(weather).to receive(:stormy?).and_return(false)
      #expect(plane.left_airport?).to eq true
      expect(subject.take_off(plane)).to be_left_airport
    end

  end 

end