require 'airport_building'

describe AirportBuilding do
 
  it 'tells a plane to land' do
    expect(plane_landing).to respond_to(:landing).with(1).argument
  end

end
