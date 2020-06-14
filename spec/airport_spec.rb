require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  
  it 'should create an instance of an airport' do
    expect(airport).to be_an_instance_of(Airport)
  end
  
  describe '#land' do
    it 'should land a plane' do
      expect(airport).to respond_to(:land).with(1).argument 
    end
    it 'should return the plane that was just landed' do
      plane = Plane.new
      # expect(airport.land(plane)).to eq(plane) : old test
      airport.land(plane)
      expect(airport.plane). to eq plane
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
      expect(airport.plane).to be_nil
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
      expect(airport).to respond_to :plane
    end
  end
end
