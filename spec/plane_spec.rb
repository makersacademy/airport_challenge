require 'plane'

describe Plane do

  context 'When not stormy' do
    it 'Can take off' do
      airport = Airport.new
      airport.stormy = false
      subject.land(airport)
      subject.take_off(airport)
      expect(airport.planes).to eq []
    end
    it 'Lands at an airport when instructed' do
      airport = double(:airport, :planes => [], :stormy => false, :full? => false)
      plane = Plane.new
      plane.land(airport)
      expect(airport.planes[0]).to eq plane
    end

    it 'Cannot land when airport is full' do
      airport = double(:airport, :planes => [], :stormy => false, :full? => true)
      expect(subject.land(airport)).to eq 'Airport is full'
    end
  end
  context 'When stormy' do
    it 'Cannot take off' do
      airport = double(:airport, :planes => [subject], stormy: true)
      expect(subject.take_off(airport)).to eq 'Too stormy to take off'
    end

    it 'Cannot land' do
      airport = double(:airport, :planes => [], :stormy => true)
      plane = Plane.new
      expect(plane.land(airport)).to eq 'Too stormy to land'
    end
  end
end
