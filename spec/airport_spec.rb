require 'airport'

describe Airport do
  let(:heathrow) { Airport.new }
  let(:bertie) { Plane.new }

  it "allows a plane to land at an airport" do
    expect(heathrow.land(bertie)).to eq([bertie])
  end

  it "allows a plane to take off" do
    heathrow.land(bertie)
    expect(heathrow.take_off(bertie)).to eq(bertie)
  end

  it "can check if there are planes at the airport" do
    expect(heathrow.planes_at_airport.kind_of?(Array)).to eq(true)
  end

  it "has a record of a plane landing" do
    heathrow.land(bertie)
    expect(heathrow.planes_at_airport).to eq([bertie])
  end

  it "removes a plane from planes_at_airport when it takes off" do
    heathrow.land(bertie)
    heathrow.take_off(bertie)
    expect(heathrow.planes_at_airport).to eq([])
  end

  it "prevents a plane from landing when the airport is at capacity" do
    heathrow.land(bertie)
    colin = Plane.new
    expect { heathrow.land(colin) }.to raise_error("A plane can't land, there's no room!")
  end

  it "allows airports to have different capacities" do
    expect(heathrow.capacity).to eq(3)
    expect(gatwick.capacity).to eq(5)
  end
end
