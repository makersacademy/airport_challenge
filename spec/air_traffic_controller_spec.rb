require 'air_traffic_controller'

describe AirTrafficController do
  it 'can tell multiple planes to take off and land' do
    expect(subject).to respond_to(:direct_planes).with(1).argument
  end
end