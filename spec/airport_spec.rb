require 'airport'
require 'plane'

describe Airport do

  describe '#initialize' do
    airport = Airport.new
    it 'initialize should set a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  context 'landing plane' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lands a plane and confirms landing' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.land(plane)).to eq plane
      # expect(airport.land(plane)).to eq "#{Plane} has landed"
    end
    #Confirm landing? Check if plane is included in array of planes at airport
  end

  context 'taking off' do
    
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'takes off a plane and confirms it is no longer in the airport' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.take_off(plane)).to eq plane
    end
    #Confirm landing? Check if plane is included in array of planes at airport

  end
end
