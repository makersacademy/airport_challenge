require "safety"
require "air_traffic_controller"
require 'weather'

default_capacity = 10
plane = Plane.new
describe AirTrafficController do

  describe "#land" do
    it 'Informs about plane landed if safe' do
      controller = AirTrafficController.new(SafetyProtocol.new(default_capacity),'sunny')
      expect(controller.land(plane)).to eq [plane]
    end

    it 'raises an error if airport is too full to land' do
      controller = AirTrafficController.new(SafetyProtocol.new(default_capacity),'sunny')
      10.times{controller.land(plane)}
      expect{controller.land(plane)}.to raise_error'Airport too full to land safely'
    end

    it 'raises an error if weather is unsafe to land' do
      controller = AirTrafficController.new(SafetyProtocol.new(default_capacity),'stormy')
      expect{controller.land(plane)}.to raise_error'Too stormy to land safely'
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
