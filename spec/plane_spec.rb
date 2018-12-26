require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#take_off' do
    it { is_expected.to respond_to :take_off }
  end

    # context '#flying_plane' do
      it 'raises an error if plane already flying' do
        # airport.land(plane)
        # flying_plane = airport.take_off(plane)
        expect { plane.take_off }.to raise_error "Cannot take off: Plane already in air"
      end
    # end
end
