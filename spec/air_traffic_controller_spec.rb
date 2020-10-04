require "air_traffic_controller"

describe AirTrafficController do
  describe '#instruct' do
    it "instructs planes if they can land" do
      atc = AirTrafficController.new
      expect(atc.instruct_to_take_off).to include("a plane can land at the airport")
    end
  end




end
