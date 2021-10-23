require 'plane'
require 'airport'

describe Plane do

  it 'lets us know that the plane is not at the airport' do
    plane = Plane.new
    expect(plane.location).to eq('airborne')
  end

  it 'planes location is changed to that of the airport' do
    airport = Airport.new
    plane = Plane.new
    allow(Weather).to receive(:stormy?) {'sunny'}
    expect{airport.landing(plane)}.to change{plane.location}.from('airborne').to(airport)
  end

  it 'planes location is changed to airborne' do
    plane = Plane.new
    airport = Airport.new
    allow(Weather).to receive(:stormy?) {'sunny'}
    airport.landing(plane)
    expect{airport.take_off(plane)}.to change{plane.location}.from(airport).to('airborne')
  end

  it 'plane can only land if it is airborne' do
    plane = Plane.new
    airport = Airport.new
    allow(Weather).to receive(:stormy?) {'sunny'}
    airport.landing(plane)
    airport_2 = Airport.new
    expect{airport_2.landing(plane)}.to raise_error 'Plane already landed'
  end

end