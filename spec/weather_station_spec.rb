require './lib/weather_station'

describe WeatherStation do
  describe '#weather' do
    it "returns sunny or stormy" do
      expect([:sunny, :stormy]).to include(subject.weather)
    end
  end
end