require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    it 'airport has plane after landing' do
      airport.land(plane)
      expect(airport.hangar).to include plane
    end
  end

  describe '#takeoff' do
    it 'plane is gone after takeoff'do
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.hangar).not_to include plane
    end
  end

end
