require './lib/airport.rb'
require './lib/weather.rb'

describe Airport do

  it "has an instance of weather" do
    heathrow = Airport.new
    expect(heathrow.weather).to be_an_instance_of(Weather)
  end

  it "has an array for a hangar" do
    heathrow = Airport.new
    expect(heathrow.hangar).to be_an_instance_of(Array)
  end

  # method edit_capacity(number)
    # changes the number, verify the change





end
