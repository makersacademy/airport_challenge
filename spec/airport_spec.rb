require 'airport'
require 'weather'

describe Airport do

  describe '#landing' do
    it 'allows planes to land' do
      plane = Plane.new
      airport = Airport.new
      allow(Weather).to receive(:stormy?) { false }
      expect(subject.land(plane)).to eq [plane]
    end
    it 'stops plane landing if airport full' do
      airport = Airport.new
      allow(airport).to receive(:bad_weather?) { false }
      Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error "Unable to land"
    end
    it 'stops plane from landing if weather is bad' do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:bad_weather?) { true }
      expect { airport.land(plane)}.to raise_error "Unable to land"
    end
  end

  describe '#takeoff' do
    it 'allows the plane to take off' do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:bad_weather?) { false }
      airport.land(plane)
      expect(airport.takeoff_plane).to eq plane
    end

    it 'stops plane from taking off if airport is empty' do
    airport = Airport.new
    expect { subject.takeoff_plane }.to raise_error "Unable to take off"
    end

    it 'stops plane from taking off if the weather is bad' do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      allow(airport).to receive(:bad_weather?) { true }
      expect { airport.takeoff_plane }.to raise_error "Unable to take off"
    end
  end

  describe '#initialize' do
    it 'should initialize with given capacity' do
      airport = Airport.new(200)
      expect(airport.capacity).to eq(200)
    end

    it 'should initialize with default capacity given no capacity' do
      airport = Airport.new
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end
end
