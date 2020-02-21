require "airport"
describe Airport do
  it "allows plane to land" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq(1)
  end
  it "allows plane to take off" do
    airport = Airport.new
    plane = Plane.new
    airport.stormy? == false
    airport.land(plane)
    expect(airport.take_off(plane)).to eq(0)
  end
  it "doesn't allow plane to land if airport is full" do
    airport = Airport.new
    plane = Plane.new
    airport.stormy? == false
    airport.capacity.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error("This airport is full, you can't land here!")
  end
  it "doesn't allow plane to take off if plane doesn't exist" do
    airport = Airport.new
    plane = Plane.new
    airport.stormy? == false
    expect { airport.take_off(plane) }.to raise_error("There are no planes to take off!")
  end
  it "allows airport to be created with over-writeable default capacity" do
    airport = Airport.new(7)
    expect(airport.capacity).to eq(7)
  end
  it "allows for a weather condition to be created" do
    airport = Airport.new
    expect(airport.stormy?).to be(true).or be(false)
  end
  it "doesn't allow planes to land if weather is stormy" do
    airport = Airport.new
    plane = Plane.new
    airport.stormy? == true
    expect { airport.land(plane) }.to raise_error("Weather is stormy, you cannot land here")
  end
  it "doesn't allow planes to take off if weather is stormy" do
    airport = Airport.new
    plane = Plane.new
    airport.stormy? == true
    expect { airport.take_off(plane) }.to raise_error("Weather is stormy, you cannot take off")
  end
end
