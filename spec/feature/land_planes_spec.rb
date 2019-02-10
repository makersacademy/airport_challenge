require './lib/plane.rb'

describe 'land plane' do
  it 'should land plane' do
    weather_double = double(:weather, is_stormy: false)
    plane = Plane.new(weather_double)

    airport = Airport.new
    plane.land(airport)

    expect(airport.planes).to eq([plane])
  end
end
