require './docs/airport'
require './docs/plane'

describe Airport do 
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }


  context "weather bad for landing" do
    before { allow(airport).to receive(:stormy?).and_return(true) }

    it 'does not allow plane to take off' do
      airport.planes << plane
      expect{airport.instruct_plane_to_land(plane)}.to raise_error 'Weather too stormy to land.'
    end

    it 'does not allow plan to land' do 
      expect{airport.instruct_plane_to_land(plane)}.to raise_error 'Weather too stormy to land.'
    end 
  end 

  context "weather good" do 

  before { allow(airport).to receive(:stormy?).and_return(false) }

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

  it "User able to change capacity" do
    airport2 = Airport.new(800)
    expect(airport2.capacity).to eq(800)
  end 

  it "Cannot land plane in full airport" do
    10.times {airport.instruct_plane_to_land(plane)}
    expect{airport.instruct_plane_to_land(plane)}.to raise_error("Unable to land as Airport is full.")
  end  
end 
end 