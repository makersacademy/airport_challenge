require 'airport'
require 'plane'

RSpec.describe Airport do
  subject(:airport) { described_class.new }

  it { is_expected.to respond_to :land }

  describe '#land' do
    it 'instructs a plane to land' do
      plane = Plane.new
      airport.land(plane)
      expect(airport.planes).to include plane
    end
  end

end
