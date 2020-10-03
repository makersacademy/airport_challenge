require 'airport'
describe Airport do
  it "receives a plane that has been instructed to land and stores it in the hangar" do
    plane = Plane.new
    airport = Airport.new
    allow_any_instance_of(Weather).to receive(:randomizer).and_return(5)
    airport.request_landing(plane)
    expect(airport.hangar).to include(plane)
  end
  it "no longer holds a plane that has been instructed to take off" do
    plane = Plane.new
    airport = Airport.new
    allow_any_instance_of(Weather).to receive(:randomizer).and_return(5)
    airport.request_landing(plane)
    airport.request_take_off(plane)
    expect(airport.hangar).not_to include(plane)
  end
  it "throws an error if a plane tries to land when the hangar is full" do
    airport = Airport.new
    allow_any_instance_of(Weather).to receive(:randomizer).and_return(5)
    expect{4.times { airport.request_landing(Plane.new) }}.to raise_error("Hangar is full")
  end
  it "throws an error if a plane tries to take off when the hangar is empty" do
    airport = Airport.new
    allow_any_instance_of(Weather).to receive(:randomizer).and_return(5)
    expect{airport.request_take_off(Plane.new)}.to raise_error
  end
  it "throws an error if a plane tries to land when it's stormy" do
    airport = Airport.new
    plane = Plane.new
    allow_any_instance_of(Weather).to receive(:randomizer).and_return(10)
    expect{ airport.request_landing(plane) }.to raise_error("DANGER! STORMY WEATHER!")
  end
  it "throws an error if a plane tries to take off when it's stormy" do
    airport = Airport.new
    plane = Plane.new
    allow_any_instance_of(Weather).to receive(:randomizer).and_return(5)
    airport.request_landing(plane)
    allow_any_instance_of(Weather).to receive(:randomizer).and_return(10)
    expect{ airport.request_take_off(plane) }.to raise_error("DANGER! STORMY WEATHER!")
  end
  it "raises an error if an airborne plane is asked to take off" do
    airport = Airport.new
    plane1 = Plane.new
    plane2 = Plane.new
    allow_any_instance_of(Weather).to receive(:randomizer).and_return(8)
    airport.request_landing(plane1)
    expect{ airport.request_take_off(plane2) }.to raise_error
  end
  it "raises an error if a plane on the ground is asked to land" do
    airport = Airport.new
    plane = Plane.new
    allow_any_instance_of(Weather).to receive(:randomizer).and_return(8)
    airport.request_landing(plane)
    expect{ airport.request_landing(plane) }.to raise_error("Plane already on the ground")
  end
  it "allows users to override default hangar capacity" do
    airport = Airport.new(1)
    expect(airport.capacity).to eq(1)
  end
  it "raises an error if planes are asked to take off from an airport other than the one they landed at" do
    airport1 = Airport.new
    airport2 = Airport.new
    plane1 = Plane.new
    plane2 = Plane.new
    allow_any_instance_of(Weather).to receive(:randomizer).and_return(8)
    airport1.request_landing(plane1)
    airport2.request_landing(plane2)
    expect{airport2.request_take_off(plane1)}.to raise_error("Plane not in hangar")
  end

end
