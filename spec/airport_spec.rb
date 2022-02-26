require 'airport'
require 'plane'

describe Airport do

  let(:airport) { Airport.new } 

  describe '#new' do
    it 'returns a new airport object' do
      expect(airport).to be_an_instance_of(Airport)
    end
  end

  describe '#land' do
    it 'responds to the land method' do
      expect(airport).to respond_to(:land)
    end

    it 'takes a plane as an argument and returns it' do
      plane = Plane.new('Boeing234')
      expect(airport.land(plane)).to eq([plane])
    end

    it 'raises an exception if the airport is full' do
      plane = Plane.new('BRITISH AIRWAYS')
      10.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error
    end
  end

  describe '#take_off' do
    it 'responds to take_off method' do
      expect(airport).to respond_to(:take_off)
    end

    it 'takes off and it confirms that there are 0 planes left in the airport' do
      plane = Plane.new('RYANAIR 77')
      expect(airport.take_off(plane)).to eq nil
    end
  end

end
