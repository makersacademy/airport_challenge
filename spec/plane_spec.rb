require 'plane'

describe Plane do

  it { is_expected.to respond_to(:land) }

  describe '#land' do

    it 'lands the plane' do
      expect(subject.land).to eq subject
    end
  end





end
