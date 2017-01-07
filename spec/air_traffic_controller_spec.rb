require 'air_traffic_controller'

describe AirTrafficController do
  it 'is able to see a plane' do
    Airport.new
    plane = Plane.new
    atc = AirTrafficController.new(plane)
    expect(atc.plane_to_instruct).to eq plane
  end
  it 'instructs planes to land at an airport' do
    expect(subject).to respond_to :instruct
    Airport.new
    plane = Plane.new
    atc = AirTrafficController.new(plane)
    atc.instruct
    expect(plane).to be_clear_to_land
  end
  it 'confirms when a plane has landed' do
    Airport.new
    plane = Plane.new
    atc = AirTrafficController.new(plane)
    atc.instruct
    plane.land
    expect(plane).to be_landed
  end
end
