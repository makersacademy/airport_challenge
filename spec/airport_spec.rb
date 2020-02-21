require "airport"
describe Airport do
  it "allows plane to land" do
    #we have an airport, we have a plane
    airport = Airport.new
    plane = Plane.new
    #act/assert
    expect(airport.land(plane)).to eq(1)
  end
  it "allows plane to take off" do
    #arrange = we have an airport, we have a plane, we have landed a plane
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    #act/assert
    expect(airport.take_off(plane)).to eq(0)
  end
  it "doesn't allow plane to land if airport is full" do
    #arrange = we have an airport, we have landed #capacity planes
    airport = Airport.new
    plane = Plane.new
    20.times {airport.land(plane)}
    #act/assert
    expect{airport.land(plane)}.to raise_error("This airport is full, you can't land here!")
  end
  it "doesn't allow plane to take off if plane doesn't exist" do
    #arrange = we have an airport, we have a plane, we haven't landed it
    airport = Airport.new
    plane = Plane.new
    expect{airport.take_off(plane)}.to raise_error("There are no planes to take off!")
  end
end
