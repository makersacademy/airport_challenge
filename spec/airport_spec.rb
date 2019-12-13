require './lib/airport'

describe Airport do

  it 'can create an airport' do
    expect(Airport.new).to be_a Airport
  end

  it 'confirms plane is gone' do
    airport = Airport.new
    plane = Plane.new
    plane.take_off(airport)
    expect(airport.plane_gone?).to be true
  end

  it 'confirms plane is not gone' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.plane_gone?).to be false
  end
end
