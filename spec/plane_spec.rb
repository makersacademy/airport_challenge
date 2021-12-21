require 'plane'

describe Plane do
  
  describe '#land' do

    it 'cannot land, if it already landed' do 
      subject.land
      expect { subject.land }.to raise_error("NotFlying")
    end     

  end

  describe '#take_off' do 
  
    it 'cannot take_off more than once' do
      subject.land
      subject.take_off 
      expect { subject.take_off }.to raise_error("AlreadyFlying")
    end

  end

end
