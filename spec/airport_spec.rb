require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  # subject(:airport) { described_class.new }
  it 'should create an instance of an airport' do
    expect(airport).to be_an_instance_of(Airport)
  end
  
  describe '#initialize' do
    it 'should have an empty array for planes instance variable' do
      expect(airport.planes).to be_an_instance_of(Array)
    end
    it 'should have a default airport capacity upon creation unless capacity provided' do
      # airport = Airport.new
      expect(airport.capacity).to eq Airport:: DEFAULT_CAPACITY
    end
    it 'should have a capacity of that provided as an argument when argument provided' do
      airport = Airport.new(5)
      expect(airport.capacity).to eq(5)
    end
  end
  
  describe '#capacity' do
    it 'should allow capacity to be overwritten at any point' do
      airport.capacity = 25
      expect(airport.capacity).to eq(25)
    end
  end

  describe '#land' do
    it 'should land a plane' do
      expect(airport).to respond_to(:land).with(1).argument 
    end
    
    it 'planes that are landed must be in an airport' do
      plane = Plane.new
      plane1 = Plane.new
      airport.land(plane)
      airport.land(plane1)
      expect(airport.planes.first).to eq plane
      expect(airport.planes.last).to eq plane1
    end

    it 'cannot land the same plane twice without take-off in between' do
      plane = Plane.new
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error("Plane already landed")
    end
    
    it 'cannot land the same plane twice without take-off in between' do
      plane = Plane.new
      airport.land(plane)
      airport.take_off(plane)
      expect { airport.land(plane) }.not_to raise_error
    end
    
    it 'raises an error when airport is full (DEFAULT_CAPACITY)/ does not land a plane beyond this amount' do
      airport.capacity.times { airport.land Plane.new }
      expect { airport.land Plane.new }.to raise_error("This airport is full")
    end
      
  end
  
  describe '#take_off' do
    it 'should allow a plane in an airport to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
    it 'should show that plane is no longer in the airport' do
      plane = Plane.new
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).to be_empty
    end
    it 'should not do anything if the plane to take off is not in airport' do
      plane = Plane.new
      plane1 = Plane.new
      airport.land(plane)
      airport.land(plane1)
      airport.take_off(plane1)
      expect { airport.take_off(plane1) }.to raise_error("the plane is not in airport")
    end
  end
  
  describe '#plane' do
    it 'should show you a plane that is in the airport' do
      expect(airport).to respond_to :planes
    end
  end
end
