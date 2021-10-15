require 'plane'

describe Plane do
  
  describe '#land' do
    
    it 'can land' do
      expect(subject).to respond_to(:land)
    end

    it 'cannot land, if it already landed' do 
      subject.land
      expect { subject.land }.to raise_error("NotFlying")
    end     

  end

end
