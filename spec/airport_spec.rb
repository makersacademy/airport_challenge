require 'airport'
require 'plane'
describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }

  it "responds to land_plane" do
    expect(airport).to respond_to :land_plane
  end

  it "stores a plane that has landed" do
    expect(airport.land_plane(plane)).to eq [plane]
  end

  it "has a default max capacity" do
    expect(Airport::DEFAULT_CAPACITY).to eq 20
  end


end
