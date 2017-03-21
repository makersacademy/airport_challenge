require 'weather'

describe Weather do

  subject(:weather) {described_class.new}

  context '#is_sunny?' do
    it 'The weather is sunny or stormy' do
      expect(weather.is_sunny?).to eq(true).or eq(false)
    end
  end

  context 'is sunny?' do
    it 'The weather is sunny' do
      allow(weather).to receive(:is_sunny?) {true}
      expect(weather.is_sunny?).to eq(true)
    end
  end

  context 'is stormy?' do
    it 'The weather is stormy' do
      allow(weather).to receive(:is_sunny?) {false}
      expect(weather.is_sunny?).to eq(false)
    end
  end

end
