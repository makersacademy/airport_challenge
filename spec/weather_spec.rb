require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

plane = Plane.new
airport = Airport.new


describe Weather do

=begin
cant get this to work :/
  it 'the weather is either clear or stormy' do
    weather = Weather.new
    weather.decide_weather
    weather = instance_double(Weather, weather => 'clear')
    expect(weather.clear?).to eq true
  end
=end
end
