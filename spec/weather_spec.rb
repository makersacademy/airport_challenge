require 'weather'

RSpec.describe do

  weather = Weather.new

  it 'will output a random weather status' do
    expect(weather).to respond_to(:weather_generator)
  end

  it 'will return true if weather is stormy' do
    expect(weather).to respond_to(:stormy_weather?)
  end

end
