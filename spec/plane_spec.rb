require 'plane'

describe Plane do

  describe '#land' do

    it 'lands the plane' do
      subject.land
      expect(subject.flying?).to eq false
    end


  end





end
