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

  describe '#land' do
    it 'can land airplanes' do 
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'can instruct a plane to land' do 
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end 

    it 'prevents landing when airport is full' do
      subject.capacity.times { subject.land Plane.new}
      expect{subject.land Plane.new}.to raise_error "The airport has reached landing capacity"
    end 
    

  end 

  describe '#take_off' do 
    it 'can instruct a plane to take off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end 

    it 'confirms the plan has taken off' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off 
      expect(subject.planes_in_the_airport).not_to include(plane)
    end 
  
    # it 'confirms the airport is no longer there after taking off' do
    #   plane = Plane.new 
    #   expect(subject).to raise_error 'This plane has taken off'
    # end 
   
    it 'tells the weather' do 
      expect(subject).to respond_to(:stormy?)
    end 

    it 'prevent taking off when stormy' do 
      plane = double(:plane)
      subject.land(plane)
      allow(subject).to receive(:stormy?).and_return(true)
      expect{subject.take_off}.to raise_error 'Cannot take off when weather is stormy'
    end 
  end 
end 