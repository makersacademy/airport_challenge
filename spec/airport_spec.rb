require './docs/airport'

describe Airport do 
  let(:airport) { Airport.new }
  let(:plane) { "plane1" }

  it "Instruct plane to land" do
    expect(airport).to respond_to(:instruct_plane_to_land)
  end
end 