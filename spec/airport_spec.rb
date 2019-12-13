require 'airport'

describe Airport do
  it 'creates an instance of Airport' do
    airport = Airport.new
    expect(airport).to be_a(Airport)
  end

  describe '#release_plane' do
    it 'lets out a plane' do
      airport = Airport.new
      plane = Plane.new
      airport.runway(plane)
      expect(airport.release_plane).to eq plane
    end
  end

  describe '#release_plane' do
    it 'raises error when plane is no longer in the airport' do
      airport = Airport.new
      plane = Plane.new
      expect { airport.release_plane }.to raise_error 'The plane has left the airport'
    end
  end

  it "releases planes that land" do
    plane = Plane.new
    expect(plane).to respond_to(:land)
  end

  it "sees planes that take off" do
    plane = Plane.new
    expect(plane).to respond_to(:takeoff)
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

  describe '#runway' do
    it 'raises an error when the airport is full' do
      airport = Airport.new
      plane = Plane.new
      expect { airport.runway(plane) }.to raise_error 'Airport is full!'
    end
  end
end
