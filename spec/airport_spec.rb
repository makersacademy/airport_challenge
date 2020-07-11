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

    it 'plane does not land when airport is full' do
      plane = Plane.new
      air_port = Airport.new
      air_port.land(plane)
      plane2 = Plane.new
      expect { air_port.land(plane2) }.to raise_error("airport is full")
    end
  end

  describe '#takeoff' do
    it 'instruct plane to takeoff' do
      plane = Plane.new
      air_port = Airport.new
      air_port.land(plane)
      expect(air_port.takeoff(air_port.planes)).to eq "plane has taken off"
    end
  end
end
