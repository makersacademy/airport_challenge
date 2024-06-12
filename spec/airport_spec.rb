require 'plane'
require 'airport'

describe Airport do 
    it 'has default capacity of 1' do 
      airport = Airport.new 
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end 
  it 'can change the capacity size' do 
      airport = Airport.new(3)
      expect(airport.capacity).to eq(3)
  end 
    
    describe '#full?' do 
        it 'returns true if full' do 
          airport = Airport.new 
          plane = Plane.new
          plane.land(airport)
        expect(airport).to be_full
        
        end 
        it 'returns false if empty'do 
          airport = Airport.new 
          expect(airport).not_to be_full
      end 
       it 'returns false if not full' do 
          airport = Airport.new(3)
          plane = Plane.new
          plane.land(airport)
        expect(airport).not_to be_full
       end 
 end 
   

end 