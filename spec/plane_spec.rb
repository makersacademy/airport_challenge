require 'plane'

describe Plane do

  context 'When not stormy' do
    it 'Can take off' do
      airport = Airport.new
      subject.land(airport)
      subject.take_off(airport)
      expect(airport.planes).to eq []
    end
    it 'Lands at an airport when instructed' do
      airport = double(:airport, :planes => [], :stormy => false)
      plane = Plane.new
      plane.land(airport)
      expect(airport.planes[0]).to eq plane
    end
  end
  context 'When stormy' do
    it 'Cannot take off' do
      airport = double(:airport, :planes => [], stormy: true)
      expect(subject.take_off(airport)).to raise_error 'Too stormy to take off'
    end
  end
end
