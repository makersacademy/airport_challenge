require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  describe '#land' do
    it 'confirms the landing' do
      expect(plane.land).to eq :landed
    end

    it 'raises error if already landed' do
      plane.land
      expect { plane.land }.to raise_error 'already landed'
    end
  end

  describe '#take_off' do
    it 'confirms the takeoff' do
      expect(plane.take_off).to eq :taken_off
    end

    it 'raises error if already taken off' do
      plane.take_off
      expect { plane.take_off }.to raise_error 'already taken off'
    end
  end
end
