require 'weather'
require 'airport'
require 'plane'

describe 'feature test' do
  it 'Planes land and take off during good weather' do
    weather1 = Weather.new
    allow(weather1).to receive(:is_stormy?) {false}
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    airport1 = Airport.new(weather1,10)
    airport1.dock(plane1)
    airport1.dock(plane2)
    airport1.dock(plane3)
    plane3 = airport1.release
    plane2 = airport1.release
    airport1.dock(plane2)
  end

  it 'Weather season can change after being passed to airport' do
    weather1 = Weather.new
    airport1 = Airport.new(weather1)
    plane1 = Plane.new
    weather1.blizzard
    expect{airport1.dock(plane1)}.to raise_error "Weather is too stormy, cannot land"
  end

end
