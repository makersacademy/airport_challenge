require 'Airport'

describe Airport do
  describe '#land' do 
    it 'does not allow landing when the airport is full' do
      # arrange
      airport = Airport.new
      plane = Plane.new
      # act 
      airport.capacity.times { airport.land(plane) }
      # assert
      expect { airport.land(plane) }.to raise_error 'ERROR! Airport is full, you cannot land'
    end

    it 'lands a plane at the airport' do 
      # arrange
      airport = Airport.new 
      plane = Plane.new
      # act 
      airport.land(plane)
      # assert 
      expect(airport.land(plane)).to eq([plane])
      end  
  end 
  describe '#take_off' do 
    it 'returns an error if there are no planes to take-off' do
      # arrange
      airport = Airport.new
      # assert
      expect { airport.take_off(plane) }.to raise_error
    end

    it 'instructs plane to take-off from airport' do
      # arrange 
      airport = Airport.new
      plane = Plane.new
      # act
      airport.take_off(plane)
      # assert
      expect(airport.take_off(plane)).to eq([plane].pop())
    end
  end 
  
end 

# arrange
# act 
# assert
