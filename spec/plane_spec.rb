require 'plane'

describe Plane do

  it 'lets us know that the plane is not at the airport' do
    plane = Plane.new
    expect(plane.location).to eq('airborne')
  end

end