require "safety"
require "air_traffic_controller"

describe AirTrafficController do
  describe "#land" do
    it 'Plane lands' do
      controller = AirTrafficController.new
      expect(controller.land).to eq 'Plane landed'
    end
  end

  describe "#take_off" do
    it 'Plane takes off' do
      controller = AirTrafficController.new
      expect(controller.take_off).to eq 'Plane took off'
    end
  end

end
