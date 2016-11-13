require 'airport'
require 'plane'
require 'weather'

class WeatherStub < Weather
  def initialize(weather)
    @weather = weather
  end

  def conditions
    @weather
  end

end

describe Airport do

  subject(:plane) {Plane.new}
  subject(:plane2) {Plane.new}
  subject(:good_weather) {WeatherStub.new("good")}
  subject(:stormy_weather) {WeatherStub.new("stormy")}
  subject(:airport) {described_class.new(good_weather.conditions)}
  subject(:stormy_airport) {described_class.new(stormy_weather.conditions)}
  subject(:airport_for_2) {described_class.new(good_weather.conditions, 2)}


  context "should confirm that the plane " do
    it "has not landed" do
      expect(airport.landed?(plane)).to eq false
    end

    it "has landed" do
      airport.land(plane)
      expect(airport.landed?(plane)).to eq true
    end

    it "cannot land because of stormy weather" do
        expect(stormy_airport.land(plane)).to eq "Can not land in stormy weather"
    end

    it "has already landed, when we try to land again" do
        airport_for_2.land(plane)
        message = "The plane has already landed"
        expect(airport_for_2.land(plane)).to eq message
    end

    it "cannot land if the airport is at full capacity" do
      airport.land(plane)
      expect(airport.land(plane2)).to eq "The airport is full, can not land"
    end

    it "won't takes off if it hasn't landed in the airport" do
      message = "The plane hasn't landed here."
      expect(airport.take_off(plane)).to eq message
    end
  end

  context "should instruct the plane " do
    it "to take off if weather conditions are good" do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.landed?(plane)).to eq false
    end

    it "not to take off if weather conditions are stormy" do
      airport.land(plane)
      expect(stormy_airport.take_off(plane)).to eq "Can not take off in stormy weather"
    end
  end

  context "should have a default capacity " do
    it "when no other indicated" do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "overriden if a value is passed" do
      expect(airport_for_2.capacity).to eq 2
    end
  end
end
