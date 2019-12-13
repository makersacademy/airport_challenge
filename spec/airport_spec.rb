require 'airport'

describe Airport do
  it 'creates an instance of Airport' do
    airport = Airport.new
    expect(airport).to be_a(Airport)
  end

  describe '#release_plane' do
    it 'lets out a plane' do
      plane = Plane.new
      airport = Airport.new
      expect(airport.release_plane).to eq plane
    end
  end

  it "releases planes that land" do
    airport = Airport.new
    plane = Plane.new
    plane = airport.release_plane
    expect(plane).to respond_to(:land)
  end

  it "sees planes on the runway" do
    plane = Plane.new
    airport = Airport.new
    expect(airport).to respond_to(:runway).with(1).argument
  end

  it "sees planes" do
    plane = Plane.new
    airport = Airport.new
    expect(airport.runway(plane)).to eq plane
  end

  it "returns runway planes" do
    plane = Plane.new
    airport = Airport.new
    airport.runway(plane)
    expect(airport.plane).to eq plane
  end
end
