require 'weather'

describe Weather do
  subject(:weather) { described_class.new }
  describe '#stormy?' do
    it { is_expected.to respond_to :stormy? }

    it 'returns true (1 in 20 chance)' do
      expect(weather).to receive(:rand).with(20) { 0 }
      expect(weather.stormy?).to be_truthy
    end

    it 'returns false (19 in 20 chances)' do
      # NOTE: unsure if using rand() in test is appropriate
      expect(weather).to receive(:rand).with(20) { rand(1..20) }
      expect(weather.stormy?).to be_falsy
    end
  end
end
