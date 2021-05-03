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
  
end 

# arrange
# act 
# assert
