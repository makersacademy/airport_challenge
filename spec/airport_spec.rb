require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  
  it 'should create an instance of an airport' do
    expect(airport).to be_an_instance_of(Airport)
  end
  
  describe '#initialize' do
    it 'should have an empty array for planes instance variable' do
      expect(airport.planes).to be_an_instance_of(Array)
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
      expect { airport.take_off(plane1) }.to raise_error("the plane is not in airport")
    end
  end
  
  describe '#plane' do
    it 'should show you a plane that is in the airport' do
      expect(airport).to respond_to :planes
    end
  end
end
