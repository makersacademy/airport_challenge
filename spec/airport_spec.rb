require 'airport'
require 'plane'
require 'weather'

class GoodRandomnessStub
  def chance
    1
  end
end

class BadRandomnessStub
  def chance
    0
  end
end

describe Airport do

  subject(:plane) {Plane.new}
  subject(:plane2) {Plane.new}
  subject(:good_weather) {Weather.new(GoodRandomnessStub.new)}
  subject(:stormy_weather) {Weather.new(BadRandomnessStub.new)}
  subject(:airport) {described_class.new(good_weather)}
  subject(:stormy_airport) {described_class.new(stormy_weather)}
  subject(:airport_for_2) {described_class.new(good_weather, 2)}


  context "should confirm that the plane " do
    it "has not landed" do
      expect(airport.landed?(plane)).to eq false
    end

    it "has landed" do
      airport.authorize_landing(plane)
      expect(airport.landed?(plane)).to eq true
    end

    it "cannot land because of stormy weather" do
        expect(stormy_airport.authorize_landing(plane)).to eq "Can not land in stormy weather"
    end

    it "has already landed, when we try to land again" do
        airport_for_2.authorize_landing(plane)
        message = "The plane has already landed"
        expect{airport_for_2.authorize_landing(plane)}.to raise_error message
    end

    it "cannot land if the airport is at full capacity" do
      airport.authorize_landing(plane)
      expect(airport.authorize_landing(plane2)).to eq "The airport is full, can not land"
    end

    it "won't takes off if it hasn't landed in the airport" do
      message = "The plane hasn't landed here."
      expect{airport.authorize_take_off(plane)}.to raise_error message
    end
  end

  context "should instruct the plane " do
    it "to take off if weather conditions are good" do
      airport.authorize_landing(plane)
      airport.authorize_take_off(plane)
      expect(airport.landed?(plane)).to eq false
    end

    it "not to take off if weather conditions are stormy" do
      airport.authorize_landing(plane)
      expect(stormy_airport.authorize_take_off(plane)).to eq "Can not take off in stormy weather"
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

  it "expect the plane status to indicate it's not flying after landing" do
    airport.authorize_landing(plane)
    expect(plane.flying).to eq false
  end

  it "expect the plane to indicate it's flying after take off" do
    airport.authorize_landing(plane)
    airport.authorize_take_off(plane)
    expect(plane.flying).to eq true  
  end
end
