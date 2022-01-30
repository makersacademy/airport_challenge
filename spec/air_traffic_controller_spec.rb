require_relative '../lib/air_traffic_controller'

describe AirTrafficController do
  describe '#land' do
    # it "responds to land with an airbourne plane" do
    #  plane = Plane.new("airbourne")
    #  airport = Airport.new(3,plane)
    #  atc = AirTrafficController.new
    #  expect(atc.land(plane, airport)).to eq "Plane landed successfully!"
    # end
    it "responds to land with an already grounded plane" do
      plane = Plane.new("grounded")
      airport = Airport.new(3,plane)
      atc = AirTrafficController.new
      expect(atc.land(plane, airport)).to eq "Plane already grounded!"
    end
    it "responds to land at an airport with fine weather" do
      plane = Plane.new("airbourne")
      airport = Airport.new(3,plane)
      allow(airport).to receive(:stormy_weather?) { false }
      atc = AirTrafficController.new
      expect(atc.land(plane, airport)).to eq "Plane landed successfully!"
    end
    it "responds to land at an airport with stormy weather" do
      plane = Plane.new("airbourne")
      airport = Airport.new(3,plane)
      allow(airport).to receive(:stormy_weather?) { true }
      atc = AirTrafficController.new
      expect(atc.land(plane, airport)).to eq "Stormy weather, so in holding queue!"
    end
  end
  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }
  end
end
