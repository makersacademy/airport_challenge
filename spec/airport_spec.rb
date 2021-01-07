require 'simplecov'
require 'airport'

describe Airport do  
  # The one-liner below is not necessary for the purposes of our methods to do something
  # it { is_expected.to respond_to(:land).with(1).argument }
  
  describe '#land' do
    
    it 'lands a plane' do
      airport = Airport.new(1)
      plane = Plane.new

      actual_result = airport.land(plane)
      expected_result = 1

      expect(actual_result).to eq expected_result
    end
    
    it 'does not allow planes to land when airport is full (capacity == 1 plane)' do
      airport = Airport.new(1)
      plane = Plane.new
      
      airport.land(plane)
      
      expect { airport.land(plane) }.to raise_error 'Airport cannot accept more than one'
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
      expected_result = 0

      expect(actual_result).to eq expected_result
    end
  end
end