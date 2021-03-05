require 'airport'

heathrow = Airport.new
bertie = Plane.new

describe Airport do
  it "allows a plane to land at an airport" do
    expect(heathrow.land).to eq(true)
  end

  it "allows a plane to take off" do
    expect(heathrow.take_off).to eq(true)
  end

  it "can check if there are planes at the airport" do
    expect(heathrow.planes_at_airport(bertie).kind_of?(Array)).to eq(true)
  end

  it "has a record of a plane landing" do
    expect(heathrow.planes_at_airport(bertie)).to eq([bertie])
  end

end
