require 'airport'
describe Airport do
  it "receives a plane that has been instructed to land and stores it in the hangar" do
    plane = Plane.new
    airport = Airport.new
    airport.request_landing(plane)
    expect(airport.hangar).to include(plane)
  end
  it "no longer holds a plane that has been instructed to take off" do
    plane = Plane.new
    airport = Airport.new
    airport.request_landing(plane)
    airport.request_take_off(plane)
    expect(airport.hangar).not_to include(plane)
  end
  it "throws an error if a plane tries to land when the hangar is full" do
    airport = Airport.new
    expect{4.times { airport.request_landing(Plane.new) }}.to raise_error("Hangar is full")
  end
  it "throws an error if a plane tries to land when it's stormy" do
    airport = Airport.new
    plane = Plane.new
    allow_any_instance_of(Weather).to receive(:randomizer).and_return(10)
    expect{ airport.request_landing(plane) }.to raise_error("DANGER! STORMY WEATHER!")
  end

end
