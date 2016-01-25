require 'airport'
require 'planes'
require 'air_traffic_controller'

describe 'feature_test' do
  it 'lands planes' do
    plane = Plane.new
    heathrow = Airport.new("London heathrow")
    bob = AirTrafficController.new
    bob.land?(plane, heathrow)
    expect(heathrow.planes_at_airport).to include plane
  end
end
