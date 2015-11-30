require 'weather'

describe Weather do
  describe '#weather_conditions' do
    it 'should report stormy weather' do
      allow(subject).to receive(:rand) { 5 }
      expect(subject.weather_conditions).to eq true
    end

    it 'should report fine weather' do
      allow(subject).to receive(:rand) { 4 }
      expect(subject.weather_conditions).to eq false
    end
  end
end
