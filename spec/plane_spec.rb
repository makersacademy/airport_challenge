require 'plane'

describe Plane do

  describe '#flying?' do
    context " when the plane is in an airport " do
        it 'returns false' do
          expect(subject.flying?).to eq false
        end
    end


  end

  describe '#land' do

    it 'lands the plane' do
      subject.land
      expect(subject.flying?).to eq false
    end


  end





end
