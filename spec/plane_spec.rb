require 'plane'

describe Plane do

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }

  describe '#land' do

    it 'confirms it has landed' do
      expect(subject.land).to eq "Tower - we have touchdown"
    end
  end

  describe '#take_off' do

    it 'confirms it has taken off from an airport' do
      expect(subject.take_off).to eq "Tower - we are now airborne"
    end
  end

end
