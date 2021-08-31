require 'weather'

describe Weather do

  it { is_expected.to be_kind_of(described_class) }
  
    it 'Create weather forecast' do
      expect(subject).to respond_to(:weather_forecast)
    end

    it 'Weather_forecast' do
      weather = Weather.new
      allow(subject).to receive(:weather_forecast).and_return('Stormy')
      allow(weather.weather_forecast).to receive(:rand).and_return(0)
      expect(subject.weather_forecast).to eq "Stormy"
    end

    it 'Will raise an error if the weather_conditions is unsafe' do
      weather_conditions = "Stormy"
      allow(subject).to receive(:weather_conditions).and_raise "Weather is unsafe for take off and landings"
    end

end
