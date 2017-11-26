require 'airport'

describe Airport do

  context 'the airport' do
    it 'should be an empty array to start with' do
      airport = Airport.new
      expect(airport.planes_at_rest).to eq []
    end
    it 'should have a defualt capactiy equal to DEFAULT_CAPACITY if no args called' do
      airport = Airport.new
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'should have a set capacity equal to the argument when called' do
      airport = Airport.new(5)
      expect(airport.capacity).to eq 5
    end
  end

  context 'landing' do
    it 'should respond to land with one argument' do
      airport = Airport.new
      expect(airport).to respond_to(:land).with(2).argument
    end
    it 'should return an array with a plane in it once a plane has landed' do
      airport = Airport.new
      plane = Plane.new
      clear_transit = double(:transit, stormy?: false)
      expect(airport.land(plane, clear_transit)).to eq [plane]
    end
    it 'should not be able to land if the weather is stormy' do
      plane = Plane.new
      airport = Airport.new
      stormy_transit = double(:transit, stormy?: true)
      expect { airport.land(plane, stormy_transit) }.to raise_error('Too stormy for landing')
    end
    it 'should not be able to take place if the airport is full' do
      airport = Airport.new(1)
      plane = Plane.new
      plane1 = Plane.new
      clear_transit = double(:transit, stormy?: false)
      airport.land(plane, clear_transit)
      expect { airport.land(plane1, clear_transit) }.to raise_error('The airport is currently full')
    end
  end

  context 'take off' do
    it 'should respond to take off with two arguments' do
      airport = Airport.new
      expect(airport).to respond_to(:take_off).with(2).argument
    end
    it 'the plane should not be at airport after the plane takes off' do
      plane = Plane.new
      airport = Airport.new
      transit = Transit.new
      airport.take_off(plane, transit)
      expect(airport.planes_at_rest).to_not include plane
    end
    it 'plane should not be able to take off if weather in transit is stromy' do
      plane = Plane.new
      airport = Airport.new
      clear_transit = double(:transit, stormy?: false)
      airport.land(plane, clear_transit)
      stormy_transit = double(:transit, stormy?: true)
      expect { airport.take_off(plane, stormy_transit) }.to raise_error('Too stormy for take off')
    end
  end
end
