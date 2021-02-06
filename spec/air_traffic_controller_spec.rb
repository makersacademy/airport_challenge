require "safety"
require "air_traffic_controller"



describe AirTrafficController do
  describe "#land" do
    it 'Plane lands' do
      controller = AirTrafficController.new
      plane = Plane.new
      expect(controller.land(plane)).to eq [plane]
    end
  end

  describe "#take_off" do
    it 'Plane takes off' do
      controller = AirTrafficController.new
      plane = Plane.new
      controller.land(plane)
      expect(controller.take_off).to eq []
    end
  end

end
