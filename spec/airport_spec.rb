require 'airport'
require 'plane'

describe Airport do
  it 'is full' do
    airport = Airport.new
    plane1 = Plane.new
    plane2 = Plane.new
    plane1.land(airport)
    plane2.land(airport)
    expect(airport.full?).to eq true
  end

  it { is_expected.to respond_to(:planes) }

  it 'knows which planes have landed' do
    airport = Airport.new
    plane = Plane.new
    plane.land(airport)
    expect(airport.planes).to eq([plane])
  end
end