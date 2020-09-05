require "airport"
require "plane"
require "weather"

describe Airport do
  let(:plane) { Plane.new }
  let(:airport) {
    airport = Airport.new
    allow(airport).to receive(:generate_weather) { "sunny" }
    airport
  }

  describe "when the airport is full" do
    it "doesn't allow planes to land" do
      Airport::DEFAULT_CAPACITY.times do
        plane = Plane.new
        plane.land(airport)
      end
      expect { plane.land(airport) }.to raise_error "Airport is at capacity"
    end

    describe "and an airplane has taken off" do
      it "is no longer at capacity" do
        plane.land(airport)
        plane.take_off
        expect { plane.land(airport) }.not_to raise_error
      end
    end
  end

  # weather

  describe "if the weather is stormy" do
    it "does not allow planes to take off" do
      plane.land(airport)
      allow(airport).to receive(:generate_weather) { "stormy" }
      expect { airport.request_take_off(plane) }.to raise_error "Weather is stormy, unsuitable for take off"
    end

    it "does not allow landing" do
      allow(airport).to receive(:generate_weather) { "stormy" }
      expect { airport.request_landing(plane) }.to raise_error "Weather is stormy, unsuitable for landing"
    end
  end

  # capacity
  describe "the airports capacity" do
    it "Checks to see if airport capacity is default" do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "Checks to see if airport capacity is the capacity set by system designer" do
      airport = Airport.new(25)
      expect(airport.capacity).to eq 25
    end
  end

  # edge cases

  describe "if airport is at capacity and stormy" do
    it "returns airport is at capacity over the current weather" do
      Airport::DEFAULT_CAPACITY.times do
        plane = Plane.new
        plane.land(airport)
      end
      allow(airport).to receive(:generate_weather) { "stormy" }
      expect { plane.land(airport) }.to raise_error "Airport is at capacity"
    end
  end

  describe "if it is stormy and plane is not at the airport" do
    it "returns plane is not located at airport over the current weather" do
      allow(airport).to receive(:generate_weather) { "stormy" }
      expect { airport.request_take_off(plane) }.to raise_error "Plane was not located at this airport"
    end
  end

  # bonus

  describe "feature test" do
    it "simulates multiple planes landing and taking off" do
      # airports
      gatwick = Airport.new(1)
      heathrow = Airport.new(2)
      # planes
      a380 = Plane.new
      dreamliner = Plane.new
      sevenfourseven = Plane.new
      privatejet = Plane.new
      allow(heathrow).to receive(:generate_weather) { "sunny" }
      allow(gatwick).to receive(:generate_weather) { "sunny" }
      # landings
      dreamliner.land(heathrow)
      privatejet.land(gatwick)
      sevenfourseven.land(heathrow)
      # taking_off
      dreamliner.take_off
      a380.land(heathrow)
      expect { dreamliner.land(gatwick) }.to raise_error
      privatejet.take_off
      a380.take_off
      expect { privatejet.land(gatwick) }.not_to raise_error
      allow(heathrow).to receive(:generate_weather) { "stormy" }
      expect { a380.land(gatwick) }.to raise_error
    end
  end
end
