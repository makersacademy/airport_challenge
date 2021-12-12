require 'airport'

describe Airport do
  
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it 'has a capacity attribute, set to 1 by default' do
    expect(airport.capacity).to eq(1)
  end

  it 'has capacity 2 when specified as parameter' do
    airport = Airport.new(2)
    expect(airport.capacity).to eq(2)
  end

  it 'has weather attribute, eq to "sunny" or "stormy" at startup' do
    weather = Weather.new
    expect(airport.weather).to eq("sunny").or eq("stormy")
  end

  describe '#land_plane(plane)' do
    it { is_expected.to respond_to(:land_plane).with(1).argument }
    
    it 'returns a plane, after landing' do
      expect(airport.land_plane(plane)).to eq plane
    end

    it 'is full; raises an error when landing' do
      airport.land_plane(plane)
      expect { airport.land_plane(plane) }.to raise_error("Permission not granted. The airport is full.")
    end
  end
    
  describe '#take_off(plane)' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    
    it 'returns a plane, after take off' do
      expect(airport.take_off(plane)).to eq plane
    end
  end
end
