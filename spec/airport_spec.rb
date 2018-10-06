require 'airport'

describe Airport do

  it 'lands plane at airport' do
    airport = Airport.new
    plane = double :plane
    airport.land(plane)
    expect(airport.planes).to eq [plane]
  end

end
