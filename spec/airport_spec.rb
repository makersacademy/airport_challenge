require 'airport'
heathrow = Airport.new

describe Airport do
  it "allows a plane to land at an airport" do
    expect(heathrow.land).to eq(true)
  end

  it "allows a plane to take off" do
    expect(heathrow.take_off).to eq(true)
  end
  
end
