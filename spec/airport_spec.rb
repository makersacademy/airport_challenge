require 'airport'
describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  it "responds to land_plane" do
    expect(airport).to respond_to :land_plane
  end

  it "stores a plane that has landed" do
    expect(airport.land_plane).to eq plane 
  end

end
