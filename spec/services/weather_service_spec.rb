require 'services/weather_service'

describe WeatherService do
  describe '#weather_report' do
    it 'returns clear weather' do
      expect(subject).to receive(:rand).and_return(10)
      expect(subject.weather_report).to eq :clear
    end
    it 'returns bad weather' do
      expect(subject).to receive(:rand).and_return(1)
      expect(subject.weather_report).to eq :storm
    end
  end
end
