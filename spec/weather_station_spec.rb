require 'weather_station.rb'

describe WeatherStation do
  it 'returns "stormy" if 0 is passed' do
    expect(subject.stormy?(0)).to be_truthy
  end

  it 'returns "fine" if any other number passed' do
    expect(subject.stormy? rand(1..9)).to be_falsy
  end
end
