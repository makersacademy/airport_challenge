require 'weather'

describe Weather do
  subject (:weather) { Weather.new }

  describe 'initialisation' do
    it 'has weather' do
      expect(weather.condition).to (be > -1).and (be < 10)
    end
  end

  describe '#stormy?' do
    it { is_expected.to respond_to :stormy? }

    it 'is stormy' do
      allow(weather).to receive(:stormy?) { true }
      expect(weather).to be_stormy
    end

    it 'is not stormy' do
      allow(weather).to receive(:stormy?) { false }
      expect(weather).not_to be_stormy
    end
  end

  describe '#update' do
    it { is_expected.to respond_to :update }

    it 'checks the weather condition' do
      expect(weather.update).to (be > -1).and (be < 10)
    end
  end

  describe '#condition' do
    it { is_expected.to respond_to(:condition) }

    it 'shows the last checked weather condition' do
      condition = weather.update
      expect(weather.condition).to eq(condition)
    end
  end

end
