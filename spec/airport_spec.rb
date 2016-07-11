require 'airport'

describe Airport do
  it { is_expected.to respond_to(:takeoff) }
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:planes) }

  describe 'Variable capacity for airport' do
    it "allows user to override a default capacity" do
      airport = Airport.new(30, :sunny)
      30.times{ airport.land double(:plane) }
      expect { airport.land double(:plane)}.to raise_error('Airport is full. Not allowed to land.')
    end
  end

  describe '.takeoff' do
    it 'allows plane to take off' do
      plane = double(:plane)
      airport = Airport.new(20, :sunny)
      airport.land(plane)
      expect(airport.takeoff).to eq plane
    end
    it "prevents plane to take off when it is stormy" do
      plane = double(:plane)
      airport = Airport.new(20, :sunny)
      airport.land(plane)
      allow(airport).to receive(:weather).and_return(:stormy)
      expect{ airport.takeoff }.to raise_error('Plane not allowed to take off due to the stormy weather.')
    end
  end

  describe '.land' do
    it 'allows plane to land' do
      plane = double(:plane)
      airport = Airport.new(20, :sunny)
      landed_plane = airport.land(plane)
      expect(landed_plane).to eq [plane]
    end
    it "prevents plane to land when it is stormy" do
      plane = double(:plane)
      airport = Airport.new(20, :stormy)
      expect{ airport.land(plane) }.to raise_error('Plane NOT allowed to land due to the stormy weather.')
    end

  end

end
