require 'airport'
require 'plane'

describe Airport do
  describe '#initialize' do
    it 'initializes with default capacity of 1' do
      expect(Airport.new.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'initializes with (10) custom capacity' do
      expect(Airport.new(10).capacity).to eq 10
    end
  end

  describe '#land' do
    it 'instruct plane to land at airport, it lands' do
      plane = Plane.new
      air_port = Airport.new
      air_port.land(plane)
      expect(air_port.planes).to eq [plane]
    end
  end

  describe '#takeoff' do
    it 'instruct plane to takeoff' do
      plane = Plane.new
      air_port = Airport.new
      air_port.land(plane)
      expect(air_port.takeoff(air_port.planes)).to eq air_port.sky

    end
  end
end
