require 'plane'

describe Plane do
  subject(:plane) { Plane.new }

  describe '#taking_off' do
    it 'changes the status of the plane after telling it to take off' do
      expect(plane.taking_off).to eq :airborne
    end
  end

  describe '#stationed?' do
    it 'checks the status of the plane' do
      expect(plane.stationed?).to eq false
      plane.stationing
      expect(plane.stationed?).to eq true
    end
  end
end
