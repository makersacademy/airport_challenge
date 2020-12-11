require 'traffic_controller'
require 'plane'
require 'airport'

RSpec::Matchers.define :be_boolean do
  match do |actual|
    expect(actual).to be(true).or be(false)
  end
end

describe TrafficController do
  let(:controller) { TrafficController.new }
  let(:plane) { Plane.new }

  it "When created, has an 'airport' object as an attribute" do
    expect(controller.airport).to be_instance_of(Airport)
  end

  describe "weather" do
    it "can check if the weather is clear" do
      expect(controller.weather_clear?).to be_boolean
    end

    it "can randomise weather" do
      outcomes = []
      100.times do
        controller.randomise_weather
        outcomes << controller.weather_clear?
      end
      expect(outcomes.count(false)).to be_between(12, 28).exclusive
      # H0 - P = 0.2
      # H1 - P ≠ 0.2
      # X ~ B(100,0.2)
      # 0.054 significance level
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
    it "when can_land? is true, returns true" do
        controller.override_weather("clear")
        expect(controller.try_land(plane)).to eq true
    end

    it "when can_land? is false, returns false" do
      controller.override_weather("stormy")
      expect(controller.try_land(plane)).to eq false
    end
    
    it "when can_land? is true, plane is in the 'airplanes' array" do
      controller.override_weather("clear")
      controller.try_land(plane)
      expect(controller.airport.in_airport?(plane)).to eq true
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
    it "when can_take_off? is true, returns true" do
      controller.override_weather("clear")
      controller.try_land(plane)
      expect(controller.try_take_off(plane)).to eq false
    end

    it "when can_take_off? is false, returns false" do
      controller.override_weather("clear")
      expect(controller.try_take_off(plane)).to eq false
    end
    
    it "when can_take_off? is true, plane is taken out of the 'airplanes' array" do
      controller.override_weather("clear")
      controller.try_land(plane)
      controller.try_take_off(plane)
      expect(controller.airport.in_airport?(plane)).to eq false
    end
  end
end
