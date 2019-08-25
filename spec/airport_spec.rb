require_relative "../lib/airport"

describe Airport do
  it "receives a plane" do
    expect(subject).to respond_to(:receive_plane).with(1).argument
  end

  it "stores plane in the hanger" do
    plane = Plane.new
    airport = Airport.new
    airport.receive_plane(plane)
    expect(airport.hanger).to eq [plane]
  end

  describe '#release_plane'
  it 'releases plane so no longer in the hanger' do
    airport = Airport.new
    plane = Plane.new
    plane.land(airport)
    airport.release_plane(plane)
    expect(airport.hanger).to eq []
  end

end
