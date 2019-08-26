require 'weather'

describe Weather do

  it 'respondes to the method #weather_forcast' do
    expect(subject).to respond_to(:weather_forcast).with(1).argument
  end

  it 'returns stormy if the random_number = 1' do
    expect(subject.weather_forcast(1)).to eq 'stormy'
  end

  it 'respondes to method random_weather' do
    expect(subject).to respond_to :random_weather
  end

end
