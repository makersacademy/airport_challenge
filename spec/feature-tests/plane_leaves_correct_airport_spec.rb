require 'airport'
require 'plane'

describe 'A plane should...' do
  it 'only be able to leave the airport it is in' do
    airport1 = Airport.new
    airport2 = Airport.new
    allow(airport1.weather).to receive(:stormy?).and_return false
    allow(airport2.weather).to receive(:stormy?).and_return false
    plane1 = Plane.new
    plane2 = Plane.new
    airport1.land plane1
    airport2.land plane2
    expect { airport2.take_off plane1 }.to raise_error 'Plane not in airport'
  end
end
