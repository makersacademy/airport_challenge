require './lib/airport'

describe Airport do

# Arrange
  it "must create a weather object, default is not full" do
    Airport.new
  end

  it "must be able to change the capacity " do
    airport = Airport.new
    expect(airport.capacity(1000)).to eq "Airport capacity is now 1000"
  end

end
