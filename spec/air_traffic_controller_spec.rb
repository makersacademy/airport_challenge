require 'air_traffic_controller'

describe AirTrafficController do

  it "responds to landing_control" do
    expect(subject).to respond_to :landing_control
  end

  it "instructs plane to land" do
    expect(subject.landing_control).to eq true
  end

end
