require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  describe '#land' do

    it 'lands at an airport unless flying' do
      plane.land
      expect { plane.land }.to raise_error('Plane is on ground!')
    end

  end

  describe '#takeoff' do

    it 'takes off from an aiport unless flying' do
      plane.land
      plane.takeoff
      expect { plane.takeoff }.to raise_error('Plane is already flying!')
    end

  end

end
