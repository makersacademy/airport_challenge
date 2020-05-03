require 'airport.rb'
require 'plane.rb'
require 'weather.rb'

describe Airport do
  it "Plane can land at an airport" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq("Plane landed at airport")
  end

  it "Plane can takeoff from an airport" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.take_off).to be_instance_of Plane
  end

  it "After takeoff plane is no longer at airport" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    airport.take_off
    expect(airport.landed_planes).to be_empty
  end

  it "Plane cannot land when airport is full" do
    airport = Airport.new
    plane = Plane.new
    Airport::DEFAULT_CAPACITY.times{airport.land(plane)}
    expect{airport.land(plane)}.to raise_error("Airport at full capacity!")
  end

  it "Plane cannot land if airport if full and capacity is changed" do
    airport = Airport.new(30)
    plane = Plane.new
    airport.capacity.times{airport.land(plane)}
    expect{airport.land(plane)}.to raise_error("Airport at full capacity!")
  end

  let(:weather) { double :weather }
  it "Plane cannot takeoff when weather is stormy" do
    airport = Airport.new
    plane = Plane.new
    allow(weather).to receive(:weather_condition).and_return("Stormy")
    puts weather
    expect{airport.take_off(plane)}.to raise_error("Plane cannot takeoff due to stormy weather!")
  end

  it "Plane cannot land when weather is stormy" do
    airport = Airport.new
    plane = Plane.new
    allow(weather).to receive(:weather_condition).and_return("Stormy")
    expect{airport.land(plane)}.to raise_error("Plane cannot land due to stormy weather!")
  end

end
