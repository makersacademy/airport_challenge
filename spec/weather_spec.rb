require 'weather'

describe Weather do
  it 'can respond to a method request of the state of weather' do
    expect(subject).to respond_to(:stormy?)
  end
  it 'returns an integer value when randomizer runs' do
    weather = Weather.new
    expect(weather.instance_variable_get(:@weather_randomizer)).to be_kind_of(Integer)
  end
  it 'returns an integer value in the allowed range of 1-5' do
    weather = Weather.new
    expect(weather.instance_variable_get(:@weather_randomizer)).to be_between(1, 5)
  end
  it 'outputs a weather report when forecast is called, mocked to stormy' do
    stormy_weather = Weather.new
    allow(stormy_weather.stormy?).to receive(:false).and_return(:true)
  end
end
