require "airport"

describe Airport do

  it "expects Airport to make working airports" do
    airport = Airport.new(10)
    expect(airport).to eq airport
  end

  it "airport to land a plane" do
    expect(Airport.new(10)).to respond_to(:land).with(1).argument
  end

  it "airport to take_off a plane" do
    expect(Airport.new(10)).to respond_to(:take_off).with(1).argument
  end

  it "airport not allow landing when is full" do
    airport = Airport.new(10)
    plane = Plane.new
    10.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error "Error, airport full!"
  end

end
