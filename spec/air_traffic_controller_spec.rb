require 'air_traffic_controller.rb'

describe AirTrafficController do

  it "responds to landing_control" do
    expect(subject).to respond_to :landing_control
  end

end
