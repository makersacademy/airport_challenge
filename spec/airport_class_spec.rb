require 'plane_class'
require 'airport_class'

describe Airport do
  it 'Check if Airport class respond to the method land' do
    expect(Airport.new).to respond_to(:land)
  end
  it 'Land a plane into the airport' do
    expect(Airport.new.land(Plane.new)[0]).to be_instance_of(Plane)
  end
end
