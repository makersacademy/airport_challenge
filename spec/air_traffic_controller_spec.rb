require_relative '../lib/air_traffic_controller'
require_relative '../lib/airport'
require 'air_traffic_controller'
require 'find'

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
      planes_list = Array.new
      airport = Airport.new(planes_list,plane,6)
      atc = AirTrafficController.new
      expect { atc.land(plane, airport) }.to raise_error("Plane already grounded!")
    end
    it "responds to land at an airport with fine weather" do
      plane = Plane.new("airbourne")
      planes_list = Array.new
      airport = Airport.new(planes_list,plane,3)
      allow(airport).to receive(:stormy_weather?) { false }
      atc = AirTrafficController.new
      expect(atc.land(plane, airport)).to eq planes_list
    end
    it "responds to land at an airport with full capacity" do
      plane = Plane.new("airbourne")
      plane1 = Plane.new("grounded")
      plane2 = Plane.new("grounded")
      planes_list = [plane1, plane2]
      airport = Airport.new(planes_list,plane,2)
      allow(airport).to receive(:stormy_weather?) { false }
      atc = AirTrafficController.new
      expect { atc.land(plane, airport) }.to raise_error("Destination airport is full, go to holding queue!")
    end
    it "responds to land at an airport with stormy weather" do
      plane = Plane.new("airbourne")
      planes_list = Array.new
      airport = Airport.new(planes_list,plane,3)
      allow(airport).to receive(:stormy_weather?) { true }
      atc = AirTrafficController.new
      expect { atc.land(plane, airport) }.to raise_error("Stormy weather, go to holding queue!")
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }
  end
end
