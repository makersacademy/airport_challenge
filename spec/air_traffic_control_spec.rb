require 'air_traffic_control'

describe AirTrafficControl do
  context "Initial context" do
    it "check responce of land method in ATC class" do
      is_expected.to respond_to(:land)
    end
  end
end
