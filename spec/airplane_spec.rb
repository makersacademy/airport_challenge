require 'airplane.rb'
require 'airport.rb'

describe "Airplane" do
  it "landed" do
    plane = Airplane.new
    expect(plane.landed).to be true
  end

  it "can land in airport" do
    plane = Airplane.new
    airport = Airport.new
    plane.land(airport)
    expect(plane.landed).to eq true
  end

  it "can take off from airport" do
    plane = Airplane.new
    airport = Airport.new
    plane.take_off(airport)
    expect(plane.landed).to eq false
  end

  it "confirm plane has taken off" do
    plane = Airplane.new
    airport = Airport.new
    plane.take_off(airport)
    expect(plane.landed).to eq false
  end
end
  describe "weather" do
    it "plane can't take off with stormy weather" do
    plane = Airplane.new
    airport = Airport.new
    airport.weather = "stormy"
    plane.take_off(airport)
    expect(plane.landed).to eq true
    end

    it "plane can't land with stormy weather" do
      plane = Airplane.new
      airport = Airport.new
      airport.weather = "stormy"
      plane.land(airport)
      expect(plane.landed).to eq false
    end
  end
