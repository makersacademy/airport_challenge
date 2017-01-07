require 'air_traffic_controller'

describe AirTrafficController do
  it 'instructs planes to land at an airport' do
    expect(subject).to respond_to :instruct
  end
end
