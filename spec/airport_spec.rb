require 'airport'

describe Airport do
  it "has a capacity of 100 when capcity not specified" do
    airport = Airport.new
    expect(airport.capacity).to eq 100
  end
end
