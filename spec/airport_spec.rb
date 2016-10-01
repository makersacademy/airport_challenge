require 'airport'
require 'plane'

describe Airport do
  subject(:airport) {described_class.new}

  it { is_expected.to respond_to :land}
  it { is_expected.to respond_to :take_off}

  describe '#land' do
    it 'allows a plane to land' do
      plane = Plane.new
      airport.land(plane)
      expect(airport.planes).to include plane
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off' do
      plane = Plane.new
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end
  end
end
