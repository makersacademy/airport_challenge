require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double(:airport) }


  describe '#landing' do
    it 'changes the status of the plane' do
      allow(airport).to receive(:planes).and_return []
      airport.planes << plane
      expect(plane.landing).to be_truthy
    end
  end

end
