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

    it 'takes a plane as a argument and returns it' do
      plane = Plane.new('Boeing234')
      expect(airport.land(plane)).to eq(plane)
    end
  end

  describe '#take_off' do
    it 'responds to take_off method' do
      expect(airport).to respond_to(:take_off)
    end
  end

end
