require 'Airport'

describe Airport do
  describe '#land' do 
    it 'lands a plane at the airport' do 
      # arrange
      airport = Airport.new 
      plane = Plane.new
      # act 
      airport.land(plane)
      # assert 
      expect(airport.land(plane)).to eq("Aircraft has landed at airport")
    end  
  end 
  describe '#take_off' do 
    it 'instructs plane to take-off from airport' do
      # arrange 
      airport = Airport.new
      plane = Plane.new
      # act
      airport.take_off(plane)
      # assert
      expect(airport.take_off(plane)).to eq("Aircraft has taken off and is no longer in the airport")
    end
  end 
  
end 

# arrange
# act 
# assert
