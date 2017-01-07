require 'air_traffic_controller'

describe AirTrafficController do
  it 'is able to see a plane' do
    Airport.new
    plane = Plane.new
    atc = AirTrafficController.new(plane)
    expect(atc.plane_to_instruct).to eq plane
  end
  it 'instructs planes to land at an airport' do
    expect(subject).to respond_to :instruct_to_land
    Airport.new
    plane = Plane.new
    atc = AirTrafficController.new(plane)
    atc.instruct_to_land
    expect(plane).to be_clear_to_land
  end
  it 'confirms when a plane has landed' do
    Airport.new
    plane = Plane.new
    atc = AirTrafficController.new(plane)
    atc.instruct_to_land
    plane.land
    expect(plane).to be_landed
  end
  it 'instructs planes to take off from an airport' do
    expect(subject).to respond_to :instruct_to_take_off
    Airport.new
    plane = Plane.new
    atc = AirTrafficController.new(plane)
    atc.instruct_to_take_off
    expect(plane).to be_clear_for_take_off
  end

end
