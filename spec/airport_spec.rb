require 'airport'

RSpec.describe Airport do 
  describe '#initialize' do 
    it 'has a default capacity' do 
      airport = Airport.new
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end 

    it 'can override the default capacity' do 
      airport = Airport.new(18)
      expect(airport.capacity).to eq (18)
    end 
  end 

  describe '#Stormy?' do
    it 'tells it is stormy' do 
      allow(subject).to receive(:rand).and_return(20)
      expect(subject.stormy?).to eq true 
    end 

    it 'tells it is sunny' do 
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.stormy?).to eq false 
    end 
  end 

  describe '#land' do
    it 'can land airplanes' do 
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'can instruct a plane to land' do 
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.land(plane)).to eq plane
    end 

    it 'prevents landing when airport is full' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(false)
      subject.capacity.times {subject.land plane}
      allow(subject).to receive(:stormy?).and_return(true)
      expect{subject.land plane}.to raise_error "The airport has reached landing capacity"
    end 

    it 'prevents landing when stormy' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(true)
      expect{subject.land(plane)}.to raise_error 'Cannot land when weather is stormy'
    end 

    it 'allows to land when sunny' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.land(plane)).to eq plane
    end 
  end 

  describe '#take_off' do 
    it 'can instruct a plane to take off' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end 

    it 'confirms the plane has taken off' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land(plane)
      subject.take_off 
      expect(subject.planes_in_the_airport).not_to include(plane)
    end 

    it 'prevent taking off when stormy' do 
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land(plane)
      allow(subject).to receive(:stormy?).and_return(true)
      expect{subject.take_off}.to raise_error 'Cannot take off when weather is stormy'
    end 

    it 'allows taking off when sunny' do
      plane = double(:plane)
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land(plane)
      allow(subject).to receive(:stormy?).and_return(false)
      subject.take_off
      expect(subject.planes_in_the_airport).not_to include(plane)
    end 
  end 
end 