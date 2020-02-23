require 'plane.rb'

describe Plane do 

  it { is_expected.to respond_to(:land) } 

  describe '#land' do
    it 'lands a plane' do
      expect(subject.land).to eq(:landed)
    end
  end

end
