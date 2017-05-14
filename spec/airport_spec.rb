require 'airport'

describe Airport do
  subject(:airport) { described_class.new("LHR")}
  it { is_expected.to respond_to(:planes_on_ground) }
  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it { is_expected.to respond_to(:takeoff_plane).with(2).argument }
  it { is_expected.to respond_to(:iata_code)}

  describe '#land_plane' do
    it 'it instructs plane to land and registers arrival' do
      plane = Plane.new("G-ZBKP")
      airport.land_plane(plane)
      expect(airport.planes_on_ground).to eq [plane.tail_number]
    end
  end

end