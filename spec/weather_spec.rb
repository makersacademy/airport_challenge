require_relative '../lib/weather.rb'

describe Weather do
  let(:weather) { Weather.new }

  it 'can be sunny or stormy' do
    expect(weather).to receive(:weather_generator) { 2 }.and_return("sunny")
    expect(weather.weather_generator).to eq "sunny"
    expect(weather).to receive(:weather_generator) { 3 }.and_return("stormy")
    expect(weather.weather_generator).to eq "stormy"
  end

end
