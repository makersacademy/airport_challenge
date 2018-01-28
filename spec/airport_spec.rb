require 'airport'

describe Airport do

  let(:airport) {Airport.new}
  let(:plane) {Plane.new}

  describe '#land' do
    before(:each) do
      airport.land(plane)
    end

    it 'stores planes that have landed' do
      expect(airport.storage).to include(plane)
    end
  end
end
