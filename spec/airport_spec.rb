require "airport"

describe Airport do

  it "should respond to the method landing_possibility" do
    airport = Airport.new("Marseille", 100, 80)
    expect(airport).to respond_to :landing_possibility?
  end

  it "should return false if the airport is the capacity is equal to the number of landed planes" do
    airport = Airport.new("Marignane", 100, 100)
    expect(airport.landing_possibility?).to eq false

  end

  it "should return true if the airport is the capacity is greater than the number of landed planes" do
    airport = Airport.new("Marignane", 100, 80)
    expect(airport.landing_possibility?).to eq true
  end

end
