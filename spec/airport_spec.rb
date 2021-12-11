require 'airport'

describe Airport do
  
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:land_plane).with(1).argument }
  
  it 'returns a plane, after landing' do
    expect(airport.land_plane(plane)).to eq plane
  end

  it 'is full; raises an error when landing' do
    airport.land_plane(plane)
    expect { airport.land_plane(plane) }.to raise_error("Permission not granted. The airport is full.")
  end
  
  it { is_expected.to respond_to(:launch_plane).with(1).argument }
  
  it 'returns a plane, after take off' do
    expect(airport.launch_plane(plane)).to eq plane
  end

end
