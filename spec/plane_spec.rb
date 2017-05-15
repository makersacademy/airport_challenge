require 'plane.rb'

describe Plane do

  subject(:plane) { described_class.new }
  let(:airport) { Airport.new }

  it { is_expected.to respond_to(:grounded) }

  describe '#grounded' do
    it 'returns "in the air" when the plane is in the air' do
      expect(plane.grounded).to eq false
      allow(airport).to receive(:stormy?) { false }
      airport.land_plane(plane)
      allow(airport).to receive(:stormy?) { false }
      airport.take_off(plane)
      expect(plane.grounded).to eq false
    end
    it 'returns "on the ground" when the plane is on the ground' do
      allow(airport).to receive(:stormy?) { false }
      airport.land_plane(plane)
      expect(plane.grounded).to eq true
    end
  end

end
