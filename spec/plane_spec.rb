require 'plane'
require 'airport'
require 'weather'

describe Plane do
  subject(:plane) { Plane.new }
  let (:airport) { Airport.new }
  let (:weather) { Weather.new }

  context 'landing' do
    it 'lands at airport' do
      allow(weather).to receive(:stormy?) { false }
      subject.land(airport, weather)
      expect(airport.planes).to include(subject)
    end

    it 'cannot land if airport is full' do
      Airport::DEFAULT_CAPACITY.times { airport.planes.push("plane") }
      expect { subject.land(airport, weather) }.to raise_error("airport is full")
    end

    it 'cannot land when weather is stormy' do
      allow(weather).to receive(:stormy?) { true }
      expect { subject.land(airport, weather) }.to raise_error("weather is stormy")
    end

    it 'cannot land when landed' do
      subject.land(airport, weather)
      expect { subject.land(airport, weather) }.to raise_error("plane has already landed")
    end
  end

  context 'departing' do
    it 'departs from airport' do
      subject.land(airport, weather)
      subject.depart(airport, weather)
      expect(airport.planes.length).to be (0)
    end

    it 'cannot depart when weather is stormy' do
      
      allow(weather).to receive(:stormy?) { true }
      expect { subject.depart(airport, weather) }.to raise_error("weather is stormy")
    end

    it 'can only depart from airports they are in' do
      airport1 = Airport.new
      airport2 = Airport.new
      subject.land(airport1, weather)
      expect { subject.depart(airport2, weather) }.to raise_error("plane is not at that airport")
    end
  
    it 'cannot take off when flying' do
      airport.planes.push(subject)
      expect { subject.depart(airport, weather) }.to raise_error("plane is already flying")
    end
  end
end
