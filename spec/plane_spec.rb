require 'plane'

describe Plane do
  subject(:plane) { described_class.new } 

  describe '#land' do
    
    it 'should set landed to be true' do
      expect(plane.land).to eq true
    end
   
    it 'should give error if already landed' do
      plane.land
      expect { plane.land }.to raise_error "That plane is already landed" 
    end  
  
  end

  describe '#take_off' do

    it 'should set landed to be false' do
      plane.land
      expect(plane.take_off).to eq false
    end

    it 'should give error if not landed' do
      expect { plane.take_off }.to raise_error "That plane is not landed"
    end
  
  end

end
    
  
  



 
   


