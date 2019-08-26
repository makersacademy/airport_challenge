require_relative "../lib/airport"

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  describe '#capacity'
  it 'Airport capacity can be modified' do
    airport = Airport.new(4)
    expect(airport.capacity). to eq 4
  end

  describe '#receive_plane'
  it "receives a plane" do
    expect(airport).to respond_to(:receive_plane).with(1).argument
  end

  it "stores plane in the hanger" do
    allow(airport).to receive(:condition?) { true }
    airport.receive_plane(plane)
    expect(airport.hanger).to eq [plane]
  end

  it 'raises an error if weather not clear to land' do
    allow(airport).to receive(:condition?) { false }
    expect { airport.receive_plane(plane) }. to raise_error 'Conditions not safe to land'
  end

  describe '#full?'
  it 'raises an error when hanger is full' do
    allow(airport).to receive(:condition?) { true }
    airport.capacity.times { airport.receive_plane(plane) }
    expect { airport.receive_plane(plane) }.to raise_error 'Airport full'
  end

  describe '#release_plane'
  it 'releases plane so no longer in the hanger' do
    allow(airport).to receive(:condition?) { true }
    plane.land(airport)
    airport.release_plane(plane)
    expect(airport.hanger).to eq []
  end

  it 'raises error if weather is not clear to fly' do
    allow(airport).to receive(:condition?) { false }
    expect { airport.release_plane(plane) }.to raise_error 'Weather bad, no fly zone'
  end
end
