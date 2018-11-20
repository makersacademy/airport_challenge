require 'plane'
require 'airport'

describe Plane do

  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  let(:weather) { double("weather",
    :set_weather_stormy => @current_weather = "storm",)
  }

  it "can check that the plane is in the hanger after landing" do
    plane.land(airport)
    expect(airport.hangar.size).to eq 1
  end

  it "check that a duplicate plane cannot be pushed into a hangar" do
    plane.land(airport)
    expect { plane.land(airport) }.to raise_exception(Exception, "That plane has already landed at the airport.")
  end

  it "can instruct a plane to take off" do
    expect(plane).to respond_to("take_off")
  end

  it "takes off from the airport and the correct plane is removed the hanger" do
    plane2 = Plane.new
    plane.land(airport)
    plane2.land(airport)
    plane2.take_off(airport)
    expect(airport.hangar.size).to eq 1
    expect(airport.hangar).to include(plane)
  end

  it "that is not in the hangar cannot take off from it" do
    expect { plane.take_off(airport) }.to raise_exception(Exception, "That plane is not in the hangar.")
  end

  it "cannot take of if weather is stormy" do
    plane.land(airport)
    airport.weather.set_weather_stormy
    expect { plane.take_off(airport) }.to raise_exception(Exception, "Are you mad! It's stormy outside!")
  end

  it "cannopt land if the weather is stormy" do
    airport.weather.set_weather_stormy
    expect { plane.land(airport) }.to raise_exception(Exception, "Don't do it captain, we don't have power!")
  end
end
