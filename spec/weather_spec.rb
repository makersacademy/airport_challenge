require 'weather'

describe Weather do
  it { is_expected.to be_instance_of(Weather) }
  it { is_expected.to respond_to(:random_weather) }
  it { is_expected.to respond_to(:stormy?) }

  describe '#random_weather' do
    it 'return fine from condition' do
      allow(subject).to receive(:random_weather) { :fine }
      expect(subject.random_weather).to eq :fine
    end
    it 'return stormy from condition' do
      allow(subject).to receive(:random_weather) { :stormy }
      expect(subject.random_weather).to eq :stormy
    end
  end

  describe '#stormy' do
    it 'return false if random_weather return fine' do
      allow(subject).to receive(:random_weather) { :fine }
      expect(subject.random_weather).to eq :fine
    end
    it 'return true if random_weather return stormy' do
      allow(subject).to receive(:random_weather) { :stormy }
      expect(subject.random_weather).to eq :stormy
    end
  end
end
