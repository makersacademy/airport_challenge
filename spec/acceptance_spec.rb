require './lib/airport'
require './lib/plane'

context 'Airport Acceptance Tests', :aggregate_failures do
  it 'can land and take off multiple planes' do
    weather_station = instance_double('WeatherStation', :weather => :sunny)
    airport = Airport.new(weather_station)
    planes = 20.times.reduce([]) { |acc, i| acc << Plane.new(i.to_s) }

    planes.each { |p| airport.land(p) }
    planes.each { |p| expect(airport.landed?(p)).to eq true }

    planes.each { |p| airport.take_off(p) }
    planes.each { |p| expect(airport.landed?(p)).to eq false }
  end
end