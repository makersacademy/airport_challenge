require 'airport'

RSpec.describe Airport do

  it 'Airport allows plane to land' do
    gatwick = Airport.new
    plane = Plane.new
    expect(gatwick.land(plane))
  end





end
