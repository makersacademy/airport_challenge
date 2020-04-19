require './docs/airport'


describe Airport do 
  let(:airport) { Airport.new }
  let(:plane) { "plane1" }

  it "Instruct plane to land" do
    expect(airport).to respond_to(:instruct_plane_to_land)
  end

  it "Adds a plane to an array in airport" do
    expect((airport.instruct_plane_to_land(plane)).count).to eq (1)
  end 
end 