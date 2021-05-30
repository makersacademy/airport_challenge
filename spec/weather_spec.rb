require 'weather'

describe Weather do
  describe '#stormy?' do
    it 'returns a sunny weather event' do
    allow(subject).to receive(:stormy?) { :sunny }
    expect(subject.stormy?).to eq :sunny
    end
    it 'returns a stormy weather event' do
      allow(subject).to receive(:stormy?) { :stormy }
      expect(subject.stormy?).to eq :stormy
    end
end

  describe '#initialize' do
    it 'has a random weather array' do
      expect(subject.weather_event).to eq [:sunny, :sunny, :sunny, :sunny, :sunny, :sunny, :sunny, :sunny, :sunny, :stormy]
    end
  end
end
