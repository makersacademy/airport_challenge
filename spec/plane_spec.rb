require 'plane'

describe Plane, :plane do
  describe '#flying?' do
    it { is_expected.to respond_to(:flying?) }

    it 'is flying when initialized' do
      expect(subject).to be_flying
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land) }
  end
end
