require "plane.rb"

describe Plane do
subject(:plane) { described_class.new }
let(:airport) {double :airport}
  describe '#landed' do
    it 'can confirm that is has landed' do
      allow(airport).to receive(:land).and_return(plane.landing)
      airport.land(plane)
      expect(plane.flying).to eq(false)
    end
  end

  describe '#taking_off' do
    it 'can confirm that is has took off' do
      allow(airport).to receive(:land).and_return(plane.landing)
      allow(airport).to receive(:take_off).and_return(plane.taking_off)
      airport.land(plane)
      airport.take_off(plane)
      expect(plane.flying).to eq(true)
    end
  end
end
