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

end