require 'airport'
require 'plane'

describe Plane do
  let(:airport) {double :airport}
  subject(:plane) {described_class.new}

  describe "#landed" do
    it 'has landed at the airport and should not be flying' do
      allow(airport).to receive(:land).and_return(plane.land)
      airport.land(plane)
      expect(plane.flying).to eq false
    end
  end

  describe "#taken off" do
    it 'has taken off and confirms that it is no longer in the airport' do
      allow(airport).to receive(:land).and_return(plane.land)
      allow(airport).to receive(:take_off).and_return(plane.take_off)
      airport.land(plane)
      airport.take_off(plane)
      expect(plane.flying).to eq true
    end
  end



end
