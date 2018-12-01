require "airport"

describe Airport do

  it "should respond to the method landing_possibility" do
    airport = Airport.new("Marignane", 100, 80)
    expect(airport).to respond_to :landing_possibility
  end

  it "should return 'you cannot land' if the airport is the capacity is equal to the number of landed planes" do
    airport = Airport.new("Marignane", 100, 100)
    expect(airport.landing_possibility).to eq "you cannot land"

  end

  it "should return 'you can land' if the airport is the capacity is greater than the number of landed planes" do
    airport = Airport.new("Marignane", 100, 80)
    expect(airport.landing_possibility).to eq "you can land"
  end

end
