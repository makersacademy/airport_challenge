require 'plane'

describe Plane do
  describe '#land' do
    it { is_expected.to respond_to(:land) }
    it 'set flying status to false' do
      subject.land
      expect(subject.flying?).to eq false
    end
  end


end
