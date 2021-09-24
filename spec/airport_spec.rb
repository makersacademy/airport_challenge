# frozen_literal_string: true

require 'airport'

RSpec.describe Airport do
  it { is_expected.to respond_to(:land) }

  describe '#land' do
    it 'lands a plan at airport' do
      plane = Plane.new
      airport = described_class.new

      airport.land(plane)

      expect(airport.hanger).to eq plane
    end
  end
end
