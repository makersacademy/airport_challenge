require 'airport'
require 'plane'

describe Airport do
  
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  
  it 'should create an instance of an airport' do
    expect(Airport.new).to be_an_instance_of(Airport)
  end
  
  describe '#land' do
    it 'lands a plane' do
      # airport = Airport.new
      # plane = Plane.new
      expect(airport.land(plane)).to eq(plane)
    end
    
    it 'prevents planes landing when at capacity' do
      10.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error 'Airport at capacity, no room for more planes'
    end
    
  end
  
  describe '#capacity' do
    it 'sets the default maximum number of planes for the airport to 10' do
      expect(airport.capacity).to eq(10)
    end
    
    it 'can alter the maximum capacity if necessary' do
      if airport.capacity == 20
        expect(airport.capacity).to eq(20)
      end
    end 
  end
  
  describe '#take_off' do
    it 'instructs planes to take off from the airport' do
     # airport = Airport.new
     # plane = Plane.new
      airport.land(plane)
      expect(airport.take_off(plane)).to eql("The plane #{plane} has just taken off")
    end
    
    it 'deletes the plane from the hangar' do
    # plane = Plane.new
      airport.land(plane)
      expect(@hangar).to eql(nil)
    end
  end
    
end
