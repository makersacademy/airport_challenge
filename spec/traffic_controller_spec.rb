require 'traffic_controller'
require 'airport'

RSpec::Matchers.define :be_boolean do
  match do |actual|
    expect(actual).to be(true).or be(false)
  end
end

describe TrafficController do
  let(:controller) { TrafficController.new }
  let(:plane) { double("Plane") }

  it "When created, has an 'airport' object as an attribute" do
    expect(controller.airport).to be_instance_of(Airport)
  end

  describe "weather" do
    it "can check if the weather is clear" do
      expect(controller.weather_clear?).to be_boolean
    end

    it "can randomise weather" do
      srand(15)
      # Set random seed to 9 so that randomness will be predictable
      controller.randomise_weather
      expect(controller.weather_clear?).to eq false
    end

    it "can override random weather" do
      controller.override_weather("clear")
      expect(controller.weather_clear?).to eq true
    end
  end

  describe "check if can land" do
    it "when the weather is clear and the airport is not full, can land" do
      controller.override_weather("clear")
      expect(controller.can_land?).to eq true
    end

    it "when the weather is stormy and the airport is not full, can't land" do
      controller.override_weather("stormy")
      expect(controller.can_land?).to eq false
    end

    it "when the weather is clear and the airport is full, can't land" do
      controller.override_weather("clear")
      controller.airport.override_max_capacity(2)
      controller.airport.load_planes(2)
      expect(controller.can_land?).to eq false
    end

    it "when the weather is stormy and the airport is full, can't land" do
      controller.override_weather("stormy")
      controller.airport.override_max_capacity(2)
      controller.airport.load_planes(2)
      expect(controller.can_land?).to eq false
    end
  end

  describe "can land a plane" do
    it "when can_land? is true, plane is in the 'airplanes' array" do
      controller.override_weather("clear")
      controller.try_land(plane)
      expect(controller.airport.in_airport?(plane)).to eq true
    end

    it "when can_land? is false, outputs error message" do
      controller.override_weather("stormy")
      expect { controller.try_land(plane) }.to raise_error("Plane can't land")
    end
  end

  describe "check if can take off" do
    it "when the weather is clear and the plane is in the airport, can take off" do
      controller.override_weather("clear")
      controller.try_land(plane)
      expect(controller.can_take_off?(plane)).to eq true
    end

    it "when the weather is stormy and the plane is in the airport, can't take off" do
      controller.override_weather("stormy")
      expect(controller.can_take_off?(plane)).to eq false
    end

    it "when the weather is clear and the plane isn't in the airport, can't take off" do
      controller.override_weather("clear")
      expect(controller.can_take_off?(plane)).to eq false
    end

    it "when the weather is stormy and the plane isn't in the airport, can't take off" do
      controller.override_weather("stormy")
      expect(controller.can_take_off?(plane)).to eq false
    end
  end

  describe "can let a plane take off" do
    it "when can_take_off? is false, raises error" do
      controller.override_weather("clear")
      controller.try_land(plane)
      expect(controller.airport.in_airport?(plane)).to eq true
      # Good weather conditions to get plane into airport
      # Then bad for test
      controller.override_weather("stormy")
      expect { controller.try_take_off(plane) }.to raise_error("Plane can't take off")
    end
    
    it "when can_take_off? is true, plane is taken out of the 'airplanes' array" do
      controller.override_weather("clear")
      controller.try_land(plane)
      controller.try_take_off(plane)
      expect(controller.airport.in_airport?(plane)).to eq false
    end
  end
end
