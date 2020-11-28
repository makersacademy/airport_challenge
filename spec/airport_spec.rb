require "airport"

describe Airport do
  it "can create an instance of Airport and assign to new variable" do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end

  it "can respond to arrival" do
    airport = Airport.new
    expect(airport).to respond_to(:arrival).with(1).argument
  end

  it "can respond to depart" do
    airport = Airport.new
    expect(airport).to respond_to(:depart).with(1).argument
  end

  it "can respond to hangar" do
    airport = Airport.new
    expect(airport).to respond_to(:hangar)
  end

  it "hangar should have an initial inventory of no planes" do
    airport = Airport.new
    expect(airport.hangar).to eq([])
  end

  it "when a plane arrives in airport, a plane is added to the hangar" do
    airport = Airport.new
    airport.arrival("airbus_516")
    expect(airport.hangar).to eq(["airbus_516"])
  end

  it "when a plane departs the airport, a plane is removed from the hangar" do
    airport = Airport.new
    airport.arrival("airbus_516")
    airport.depart("airbus_516")
    expect(airport.hangar).to eq([])
  end

  it "the hangar can take a capacity of three planes" do
    airport = Airport.new
    3.times {airport.arrival("plane")}
    expect(airport.hangar).to eq(["plane", "plane", "plane"])
  end

  it "the hangar can take a capacity of five planes" do
    airport = Airport.new
    5.times {airport.arrival("plane")}
    expect(airport.hangar).to eq(["plane", "plane", "plane", "plane", "plane"])
  end

  it "the hangar will raise and error when six planes are added" do
    airport = Airport.new
    expect { 6.times {airport.arrival("p")} }.to raise_error(RuntimeError)
  end

  it "edge case test: the hangar will raise and error when one thousand planes are added" do
    airport = Airport.new
    expect { 1000.times {airport.arrival("p")} }.to raise_error(RuntimeError)
  end

end