require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#stormy?' do
    it 'returns true when stormy' do
      allow(weather).to receive(:chances_of_stormy).and_return(0.9)
      expect(weather.stormy?).to be true

    end
    it 'returns false when not stormy' do
      allow(weather).to receive(:chances_of_stormy).and_return(0.3)
      expect(weather.stormy?).to be false

    end

    # it 'returns true when stormy' do
    #   allow(weather).to receive(:weather_type).and_return(:stormy)
    #   expect(subject.stormy?).to be true
    # end
    # it 'returns false when not stormy' do
    #   allow(weather).to receive(:weather_type).and_return(nil)
    #   expect(subject.stormy?).to be false
    # end
  end
end
