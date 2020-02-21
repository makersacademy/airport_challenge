require "airport"
describe Airport do
  #I have assumed that an airport is created with no planes
  it "allows plane to land" do
    #there is an airport, there is a plane
    airport = Airport.new
    plane = Plane.new
    #act/assert
    expect(airport.land(plane)).to eq(1)
  end
  it "allows plane to take off" do
    #arrange = there is an airport, there is a plane, a plane has landed at the airport
    airport = Airport.new
    plane = Plane.new
    airport.stormy? == false
    airport.land(plane)
    #act/assert
    expect(airport.take_off(plane)).to eq(0)
  end
  it "doesn't allow plane to land if airport is full" do
    #arrange = there is an airport, #capacity planes have landed
    airport = Airport.new
    plane = Plane.new
    airport.stormy? == false
    airport.capacity.times {airport.land(plane)}
    #act/assert
    expect{airport.land(plane)}.to raise_error("This airport is full, you can't land here!")
  end
  it "doesn't allow plane to take off if plane doesn't exist" do
    #arrange = there is an airport, there is a plane, no planes have landed at the airport
    airport = Airport.new
    plane = Plane.new
    airport.stormy? == false
    expect{airport.take_off(plane)}.to raise_error("There are no planes to take off!")
  end
  it "allows airport to be created with over-writeable default capacity" do
    #arrange
    airport = Airport.new(7)
    #act/assert
    expect(airport.capacity).to eq(7)
  end
  it "allows for a weather condition to be created" do
    #arrange
    airport = Airport.new
    plane = Plane.new
    #act/assert
    expect(airport.stormy?).to be(true).or be(false)
  end
  it "doesn't allow planes to land if weather is stormy" do
    #arrange
    airport = Airport.new
    plane = Plane.new
    airport.stormy? == true
    #act / assert
    expect{airport.land(plane)}.to raise_error("Weather is stormy, you cannot land here")
  end
end
