require 'airport'

heathrow = Airport.new
bertie = Plane.new

describe Airport do
  it "allows a plane to land at an airport" do
    expect(heathrow.land(bertie)).to eq([bertie])
  end

  it "allows a plane to take off" do
    expect(heathrow.take_off(bertie)).to eq(bertie)
  end

  it "can check if there are planes at the airport" do
    expect(heathrow.planes_at_airport.kind_of?(Array)).to eq(true)
  end

  it "has a record of a plane landing" do
    heathrow.land(bertie)
    expect(heathrow.planes_at_airport).to eq([bertie])
  end

  # it "removes a plane from planes_at_airport when it takes off" do
  #   expect(heathrow.take_off(bertie)).to
  # end
end
