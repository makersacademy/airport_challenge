require 'simplecov'
require 'airport'

describe Airport do  
  # The one-liner below is not necessary for the purposes of our methods to do something
  # it { is_expected.to respond_to(:land).with(1).argument }
  
  describe '#land' do
    
    it 'lands a plane' do
      capacity = Airport::DEFAULT_CAPACITY
      airport = Airport.new(capacity)
      plane = Plane.new

      actual_result = airport.land(plane)
      expected_result = [plane]

      expect(actual_result).to eq expected_result
    end
    
    it 'does not allow planes to land when airport is full (capacity == 1 plane)' do
      airport = Airport.new(1)
      plane = Plane.new
      
      # p airport.capacity 1
      airport.land(plane)
      
      expect { airport.land(plane) }.to raise_error 'Airport cannot accept more planes: Full'
    end
    it 'does not allow planes to land when airport is full (capacity == 2 planes)' do
      airport = Airport.new(2)
      plane = Plane.new
      
      airport.land(plane)
      airport.land(plane)
      
      expect { airport.land(plane) }.to raise_error 'Airport cannot accept more planes: Full'
    end
  end
  
  # The one-liner below is not necessary for the purposes of our methods, since we want out methods do something
  #it { is_expected.to respond_to(:take_off).with(1).argument }
  
  describe '#take_off' do
    
    it 'allows a plane to take off from the airport' do
      airport = Airport.new(1)
      plane = Plane.new

      landed_plane = airport.land(plane)
      actual_result = airport.take_off(landed_plane)
      expected_result = plane

      expect(actual_result).to eq expected_result
    end
  end
  it 'does not allow planes to land when airport is full (DEFAULT capacity == 20 planes)' do
    capacity = Airport::DEFAULT_CAPACITY
    airport = Airport.new(capacity)
    plane = Plane.new
    
    Airport::DEFAULT_CAPACITY.times do
      airport.land(plane)
    end
    
    expect { airport.land(plane) }.to raise_error 'Airport cannot accept more planes: Full'
  end
end