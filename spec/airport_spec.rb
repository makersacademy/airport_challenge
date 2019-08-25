require_relative "../lib/airport"

describe Airport do
  describe '#receive_plane'
  it "receives a plane" do
    expect(subject).to respond_to(:receive_plane).with(1).argument
  end

  it "stores plane in the hanger" do
    plane = Plane.new
    airport = Airport.new
    allow(airport).to receive(:condition?) { true }
    airport.receive_plane(plane)
    expect(airport.hanger).to eq [plane]
  end

  it 'raises an error if weather not clear to land' do
    plane = Plane.new
    airport = Airport.new
    allow(airport).to receive(:condition?) {false}
    expect { airport.receive_plane(plane) }. to raise_error 'Conditions not safe to land'
  end


  describe '#release_plane'
  it 'releases plane so no longer in the hanger' do

    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:condition?) { true }
    plane.land(airport)
    airport.release_plane(plane)
    expect(airport.hanger).to eq []
  end

  it 'raises error if weather is not clear to fly' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:condition?) { false }
    expect { airport.release_plane(plane) }.to raise_error 'Weather bad, no fly zone'
  end
end
