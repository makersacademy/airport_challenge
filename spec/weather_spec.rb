require 'weather'

describe Weather do 
  let(:weather) { Weather.new }
  it 'returns a number between 1 and 6 in weather_number' do 
    expect(weather.weather_number).to be < 7
    expect(weather.weather_number).to be > 0 
  end 
end
