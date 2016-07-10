require 'weather'

describe Weather do

  describe '#stormy?' do
    it 'returns true if the weather is stormy' do
      subject.set_stormy
      expect(subject).to be_stormy
    end
  end

  describe '#set_stormy' do
    it 'allows to set the weather to stormy' do
      expect(subject.set_stormy).to eq true
    end
  end

  describe '#set_sunny' do
    it 'allows to set the weather to sunny' do
      expect(subject.set_sunny).to eq true
    end
  end

  describe '#sunny?' do
    it 'returns true if the weather is sunny' do
      subject.set_sunny
      expect(subject).to be_sunny
    end
  end

  describe 'initialize' do
    it 'generates a random weather upon initialization' do
      srand 1
      weather = described_class.new
      expect(weather).to be_stormy
    end
    it 'generates a random weather upon initialization' do
      srand 2
      weather = described_class.new
      expect(weather).to be_sunny
    end
  end

end
