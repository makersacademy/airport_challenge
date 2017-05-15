require 'plane.rb'

describe Plane do

  subject(:plane) { described_class.new }
  let(:airport) { Airport.new }

  it { is_expected.to respond_to(:status) }

  describe '#status' do
    it 'returns "in the air" when the plane is in the air' do
      expect(plane.status).to eq "In the air!"
      allow(airport).to receive(:stormy?) { false }
      airport.land_plane(plane)
      allow(airport).to receive(:stormy?) { false }
      airport.take_off(plane)
      expect(plane.status).to eq "In the air!"
    end
    it 'returns "on the ground" when the plane is on the ground' do
      allow(airport).to receive(:stormy?) { false }
      airport.land_plane(plane)
      expect(plane.status).to eq "On the ground!"
    end
  end

end
