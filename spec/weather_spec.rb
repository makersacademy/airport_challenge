require 'weather'

describe Weather do
  describe '#storm?' do
    it 'rand function is called in storm?' do
      expect(subject).to receive(:rand).with(10)
      subject.storm?
    end
    it 'checks storm? method returns what random gives (false)' do
      allow(subject).to receive(:rand).with(10).and_return(5)
      expect(subject.storm?).to eq(false)
    end
    it 'checks storm? method returns what random gives (true)' do
      allow(subject).to receive(:rand).with(10).and_return(0)
      expect(subject.storm?).to eq(true)
    end
  end

  describe '#stormy' do
    it 'returns the correct status of weather when called when init' do
      weather = Weather.new
      expect(weather.stormy).to eq(false)
    end
    it 'returns correct status of weather when changed' do
      allow(subject).to receive(:rand).with(10).and_return(0)
      subject.update_weather
      expect(subject.stormy).to eq(true)
    end
  end
  describe '#update_weather' do
    it 'checks update weather returns correctly given .storm? call of true' do
      allow(subject).to receive(:storm?).and_return(true)
      subject.update_weather
      expect(subject.stormy).to eq(true)
    end
    it 'checks update weather returns correctly given .storm? call of false' do
      allow(subject).to receive(:storm?).and_return(false)
      subject.update_weather
      expect(subject.stormy).to eq(false)
    end
  end
end