require_relative '../lib/airport'

describe Airport do
  describe '#land' do
    # plane = plane.new
    # subject.land(plane)
      it 'instructs a plane to land at an airport' do
      is_expected.to respond_to :land
      end
    end
end