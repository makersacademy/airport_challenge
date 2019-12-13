require './lib/weather'

describe Weather do
  # Stub needed here
  it 'returns a value between 1 and 10' do
    weather = DummyWeather.new
    expect(weather.good_weather?).to_not be(nil)
  end


end