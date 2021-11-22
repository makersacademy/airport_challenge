require 'plane'
require 'airport'

describe Plane do
  subject(:plane) { Plane.new }
  let (:airport) { Airport.new }

  context 'landing' do
    it 'lands at airport' do
      allow(airport).to receive(:stormy?) { false }
      subject.land(airport)
      expect(airport.planes).to include(subject)
    end

    it 'cannot land if airport is full' do
      Airport::DEFAULT_CAPACITY.times { airport.planes.push("plane") }
      expect { subject.land(airport) }.to raise_error("airport is full")
    end

    it 'cannot land when weather is stormy' do
      allow(airport).to receive(:stormy?) { true }
      expect { subject.land(airport) }.to raise_error("weather is stormy")
    end

    it 'cannot land when landed' do
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error("plane has already landed")
    end
  end

  context 'departing' do
    it 'departs from airport' do
      subject.land(airport)
      subject.depart(airport)
      expect(airport.planes.length).to be (0)
    end

    it 'cannot depart when weather is stormy' do
      
      allow(airport).to receive(:stormy?) { true }
      expect { subject.depart(airport) }.to raise_error("weather is stormy")
    end

    it 'can only depart from airports they are in' do
      airport1 = Airport.new
      airport2 = Airport.new
      subject.land(airport1)
      expect { subject.depart(airport2) }.to raise_error("plane is not at that airport")
    end
  
    it 'cannot take off when flying' do
      airport.planes.push(subject)
      expect { subject.depart(airport) }.to raise_error("plane is already flying")
    end
  end
end
