require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  describe '#land' do
    it 'confirms the landing' do
      expect(plane.land).to eq :landed
    end
  end

  describe '#take_off' do
    it 'confirms the takeoff' do
      expect(plane.take_off).to eq :taken_off
    end
  end
end
