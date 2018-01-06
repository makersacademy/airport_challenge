require 'plane'
require 'airport'

describe 'Plane can confirm its own flying status' do
  it 'Returns true if plane is not in airport' do
    plane = Plane.new
    expect(plane.flying?).to eq true
  end

  it 'Returns false if plane is in airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(plane.flying?).to eq false
  end
end
