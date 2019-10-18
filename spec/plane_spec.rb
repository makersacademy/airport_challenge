require 'plane'

describe Plane do
  describe 'land' do
    it 'Lands at an airport when instructed' do
      airport = Airport.new
      plane = Plane.new
      plane.land(airport)
      expect(airport.planes[0]).to eq plane
    end
  end
  describe 'take off'
    it 'Can take off' do
      airport = Airport.new
      subject.land(airport)
      subject.take_off(airport)
      expect(airport.planes).to eq []
    end
end
