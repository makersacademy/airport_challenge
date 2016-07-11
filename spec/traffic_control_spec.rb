require 'traffic_control'

describe "TrafficControl" do

  let(:weather) {double("weather")}
  traffic_control = TrafficControl.new

  describe "allow_landing_and_take_off_depending_on_weather" do
    it "should allow a plane to land if weather is sunny" do
      allow(weather).to receive(:state) {"sunny"}
      traffic_control.allow_landing_and_take_off_depending_on(weather)
      expect(traffic_control.permission?).to eq true
    end

    it "should not allow a plane to land if weather is stormy" do
      allow(weather).to receive(:state) {"stormy"}
      traffic_control.allow_landing_and_take_off_depending_on(weather)
      expect(traffic_control.permission?).to eq false
    end
  end

end
