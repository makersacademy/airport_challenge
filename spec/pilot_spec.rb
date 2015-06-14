require 'pilot'

describe Pilot do
  it "sends taking of permission if afirmative" do
    air_traffic_controller = double :air_traffic_controller, request_taking_off_permission: :afirmative
    expect( air_traffic_controller.request_taking_off_permission ).to eq take_off
  end
    
end