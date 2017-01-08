require 'weather'

describe Weather do

  it 'responds to the method set weather' do
    expect(subject).to respond_to(:set_weather)
  end

  it 'responds to the method stormy?' do
    expect(subject).to respond_to(:stormy?)
  end

  it 'method stormy responds true if weather is stormy' do
    weather = (Weather.new)
    allow(weather).to receive(:weather_rand) {2}
    weather.set_weather
    expect(weather.stormy?).to eq(true)
  end

  it 'method stormy responds false if weather is sunny' do
    weather = (Weather.new)
    allow(weather).to receive(:weather_rand) {1}
    weather.set_weather
    expect(weather.stormy?).to eq(false)
  end

end
