require './docs/airport'


describe Airport do 
  let(:airport) { Airport.new }
  let(:plane) { "plane1" }

  it "Instruct plane to land" do
    expect(airport).to respond_to(:instruct_plane_to_land)
  end

  it "Adds a plane to an array in airport when landing method ran" do
    airport.instruct_plane_to_land(plane)
    expect(airport.planes).to eq ([plane])
  end 

  it "Instructs plane to take off" do 
    expect(airport).to respond_to(:instruct_plane_to_takeoff)
  end 

  it "Removed plane from array when taking off method ran" do
    airport.instruct_plane_to_land(plane)
    airport.instruct_plane_to_takeoff(plane)
    expect(airport.planes).to eq ([])
  end 

  
end 