require 'plane'
require 'airport'

describe Plane do

  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  before do
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

end