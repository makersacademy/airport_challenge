require 'plane'

describe Plane do
  subject(:plane) { Plane.new }

  describe '#taking_off' do
    it 'changes the status of the plane after telling it to take off' do
      expect(plane.taking_off).to eq :in_the_air
    end
  end

  describe '#stationed?' do
    it 'checks the status of the plane' do
      expect(plane.stationed?).to eq true
      plane.taking_off
      expect(plane.stationed?).to eq false
    end
  end
end
