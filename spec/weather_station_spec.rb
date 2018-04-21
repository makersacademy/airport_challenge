require 'weather_station.rb'

describe WeatherStation do
  it 'returns "stormy" if 0 is passed' do
    expect(subject.getWeather(0)).to eq 'stormy'
  end

  it 'returns "fine" if any other number passed' do
    expect(subject.getWeather(rand(10)+1)).to eq 'fine'
  end
end
