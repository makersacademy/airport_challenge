require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:land_plane).with(1).argument }

  it 'returns a plane, after landing' do
    expect(airport.land_plane(plane)).to eq plane
  end

end
