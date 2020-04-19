require './docs/airport'
require './docs/plane'

describe Airport do 
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it "Instruct plane to land" do
    expect(airport).to respond_to(:instruct_plane_to_land)
  end

  it "Adds a plane to an array in airport when landing method ran" do
    airport.instruct_plane_to_land(plane)
    expect(airport.planes).to eq([plane])
  end 

  it "Instructs plane to take off" do 
    expect(airport).to respond_to(:instruct_plane_to_takeoff)
  end 

  it "Removed plane from array when taking off method ran" do
    plane2 = Plane.new 
    airport.instruct_plane_to_land(plane2)
    expect{airport.instruct_plane_to_takeoff(plane2)}.to change {airport.planes.count }.by(-1)
  end 

  it "Cannot land plane in full airport" do
    10.times {airport.instruct_plane_to_land(plane)}
    expect{airport.instruct_plane_to_land(plane)}.to raise_error("Unable to land as Airport is full.")
  end 

  it "User able to change capacity" do
    airport2 = Airport.new(800)
    expect(airport2.capacity).to eq(800)
  end 

  it "Unable to take off if stormy" do
    airport.instruct_plane_to_land(plane)
    allow(airport).to receive(:stormy?).and_return(85)
    expect{airport.instruct_plane_to_takeoff(plane)}.to raise_error("Weather too stormy to take off.")
  end 


end 
