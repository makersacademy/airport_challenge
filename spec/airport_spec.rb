require 'airport'
require 'plane'
# require 'weather'

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
    it 'instruct plane to land at airport, it lands as weather is not stormy' do
      plane = Plane.new
      air_port = Airport.new
      allow(air_port).to receive(:rand).and_return(5)
      expect(air_port.land(plane)).to eq "plane landed"
    end

    it 'instructs plane to land, but its too stormy so it raises error' do
      plane = Plane.new
      air_port = Airport.new
      allow(air_port).to receive(:rand).and_return(1)
      expect { air_port.land(plane) }.to raise_error("too stormy to land")
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
    it 'instruct plane to takeoff, it doesnt as its too stormy, returns error' do
      plane = Plane.new
      air_port = Airport.new
      air_port.land(plane)
      allow(air_port).to receive(:rand).and_return(1)
      expect { air_port.takeoff(air_port.planes) }.to raise_error("too stormy to take off")
    end

    it 'instruct plane to takeoff, it takes off' do
      plane = Plane.new
      air_port = Airport.new
      air_port.land(plane)
      allow(air_port).to receive(:rand).and_return(5)
      expect(air_port.takeoff(air_port.planes)).to eq("plane has taken off")
    end
  end
end
