require 'weather_station.rb'

describe WeatherStation do
  it 'returns "stormy" if 0 is passed' do
    expect(subject.isStormy(0)).to be_truthy
  end

  it 'returns "fine" if any other number passed' do
    expect(subject.isStormy(rand(10)+1)).to be_falsy
  end
end
