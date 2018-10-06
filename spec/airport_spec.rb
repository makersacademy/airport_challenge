require 'airport'

describe Airport do

  describe '#landing' do
    it 'allows planes to land' do
      plane = Plane.new
      weather = Weather.new
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe '#takeoff' do
    it 'allows the plane to take off' do
      plane = Plane.new
      weather = Weather.new
      subject.land(plane)
      expect(subject.takeoff_plane).to eq plane
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
