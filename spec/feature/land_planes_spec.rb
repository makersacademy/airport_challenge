require './lib/plane.rb'
require './lib/airport.rb'

describe 'land plane' do
  it 'should land plane' do
    weather_double = double(:weather, is_stormy: false)
    is_airborne = true
    plane = Plane.new(weather_double, is_airborne)

    airport = Airport.new
    plane.land(airport)

    expect(airport.planes).to eq([plane])
  end
end
