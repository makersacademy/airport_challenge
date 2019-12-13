require 'airport'

describe Airport do

  it "can create an instance of the class Airport" do
    airport = Airport.new
    expect(airport).to be_a Airport
  end
  
  it "has a method to instruct a plane to land at the airport" do
    expect(Airport.new).to respond_to(:land)
  end

end
