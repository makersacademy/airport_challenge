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

  it 'only be able to able to land once' do
    airport = Airport.new
    allow(airport.weather).to receive(:stormy?).and_return false
    plane = Plane.new
    airport.land plane
    expect { airport.land plane }.to raise_error 'This plane is not flying'
  end
end
