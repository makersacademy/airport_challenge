require 'airport'

RSpec.describe Airport do 
  describe '#initialize' do 
    it 'has a default capacity' do 
      airport = Airport.new
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
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
  end 

  describe '#take_off' do 
    it 'can instruct a plane to take off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end 
  
    # it 'confirms the airport is no longer there after taking off' do
    #   plane = Plane.new 
    #   expect(subject).to raise_error 'This plane has taken off'
    # end 
  end 
end 