require 'plane'

describe Plane do
  let(:plane) { Plane.new }
  it 'can land' do
    airport = Airport.new
     landed_plane = airport.land(plane)[-1]
     expect(landed_plane.flying).to eq false
  end
end
