require 'plane'
require 'airport'

describe Plane do

  it 'lets us know that the plane is not at the airport' do
    plane = Plane.new
    expect(plane.location).to eq('airborne')
  end

  it 'planes location is changed to that of the airport' do
    plane = Plane.new
    airport = Airport.new
    expect{airport.landing(plane)}.to change{plane.location}.from('airborne').to(airport)
  end

  it 'planes location is changed to airborne' do
    plane = Plane.new
    airport = Airport.new
    airport.landing(plane)
    expect{airport.take_off(plane)}.to change{plane.location}.from(airport).to('airborne')
  end

end