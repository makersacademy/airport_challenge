require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#stormy?' do
    it { is_expected.to respond_to(:stormy?) }

    it 'can be stormy weather' do
      srand 1
      expect(weather).to be_stormy
    end

    it 'can be not stormy weather' do
      srand 0
      expect(weather).not_to be_stormy
    end
  end
end
