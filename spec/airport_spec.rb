require 'airport'

describe Airport do

  it "can create an instance of the class Airport" do
    airport = Airport.new
    expect(airport).to be_a Airport
  end

  it "has a method to instruct a plane to land at the airport" do
    expect(Airport.new).to respond_to(:land)
  end

  it "includes a plane that has landed in a list of landed planes" do
    airport = Airport.new
    airport.land("Cathay Pacific")
    expect(airport.landed_planes).to include ("Cathay Pacific")
  end

  it "has a method to instruct a plane to take off" do
    expect(Airport.new).to respond_to(:take_off)
  end

  it "confirms that a plane has taken off from the airport" do
    airport = Airport.new
    airport.land("Cathay Pacific")
    allow(airport).to receive(:check_weather) {"sunny"} #adding the stormy weather functionality has broken
    #this test so adding a stub/mock here too to make sure that this test only tests the take off
    #functionality and does not fail because of weather
    airport.take_off("Cathay Pacific")
    expect(airport.landed_planes).not_to include ("Cathay Pacific")
  end

  it "raises error when airport is at full capacity" do
    airport = Airport.new
    20.times { airport.land("Cathay Pacific") }
    expect { airport.land("Cathay Pacific") }.to raise_error("Landing not possible, the airport is at full capacity.")
  end

  it "allows default capacity to be overriden" do
    airport = Airport.new(30)
    30.times { airport.land("Cathay Pacific") }
    expect(airport.landed_planes.count).to eq 30
  end

  it "prevents take off when wheather is stormy" do
    airport = Airport.new
    airport.land("Cathay Pacific")
    allow(airport).to receive(:check_weather) {"stormy"} #trying to set the check_weather method always return "stormy"
    expect(airport.take_off("Cathay Pacific")).to raise_error("Take off not possible due to stormy weather.")
  end

end
