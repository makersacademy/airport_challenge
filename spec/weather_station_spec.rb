require 'weather_station'

describe WeatherStation do

  describe '#new' do
    it 'Initialise with one argument' do
      expect(WeatherStation).to respond_to(:new).with(1).argument
    end
    it 'Initialise with no arguments' do
      expect(WeatherStation).to respond_to(:new).with(0).arguments
    end
  end

  describe '#report' do
    it 'Report test_value' do
      ws = WeatherStation.new('test_value')
      expect(ws.report).to eq('test_value')
    end
    it 'Report weather when no test value set' do
      ws = WeatherStation.new
      expect(ws.report).not_to eq(nil)
    end
  end

end
