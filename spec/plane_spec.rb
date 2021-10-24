require 'plane'
require 'airport'

describe Plane do

  let(:plane) { Plane.new }
  let(:airport) { double('airport') }
  let(:land) { airport.landing(plane) }
  let(:take_off) { airport.take_off(plane) }
  before do
    allow(airport).to receive(:landing) { plane.land(airport) }
    allow(airport).to receive(:take_off) { plane.take_off }
    allow(Airport).to receive(:stormy?) {false}
  end

  it 'lets us know that the plane is not at the airport' do
    expect(plane.location).to eq('airborne')
  end

  it 'plane can only land if it is airborne' do
    airport.landing(plane)
    airport_2 = Airport.new
    expect{airport_2.landing(plane)}.to raise_error 'Plane already landed'
  end

  it 'planes location is changed to that of the airport' do
    expect {land}.to change {plane.location}.from('airborne').to(airport)
  end

  it 'planes location is changed to airborne' do
    land
    expect {take_off}.to change {plane.location}.from(airport).to('airborne')
  end

end