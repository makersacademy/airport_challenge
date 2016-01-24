require 'Air_traffic_controller'

describe AirTrafficController do

  describe "#name" do
    it "returns the correct name" do
      tc = AirTrafficController.new("Name")
      expect(tc.name).to eq "Name"
    end
  end

  describe "#take_off" do
  end

  describe "#land" do
  end

  describe "#check_planes" do
  end
  
end
