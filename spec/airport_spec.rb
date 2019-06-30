require './lib/airport.rb'

describe Airport do

  it "Has the capacity set to a default" do
    airport = Airport.new()
    expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  it "Allows for setting up a different capacity" do
    airport = Airport.new(30)
    expect(airport.capacity).to eq(30)
  end
end
