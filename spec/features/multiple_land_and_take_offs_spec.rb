require 'airport'
describe 'multiple planes land at airport then take off' do
  let(:plane1) { Plane.new }
  let(:plane2) { Plane.new }
  let(:plane3) { Plane.new }
  let(:plane4) { Plane.new }
  let(:weather) { Weather.new }
  let(:airport) { Airport.new(weather) }
  it 'can land and store multiple planes' do
    10.times { land_plane_clear_weather(airport, weather, Plane.new) }
    expect(airport.hangar.count).to eq 10
  end
  it 'multiple planes can land and take off' do
    land_plane_clear_weather(airport, weather, plane1)
    land_plane_clear_weather(airport, weather, plane2)
    land_plane_clear_weather(airport, weather, plane3)
    land_plane_clear_weather(airport, weather, plane4)
    airport.take_off(plane1)
    airport.take_off(plane4)
    airport.take_off(plane3)
    expect(airport.hangar).to eq [plane2]
  end
end
