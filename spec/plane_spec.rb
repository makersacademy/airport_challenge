require 'plane'

describe Plane do

  subject(:plane) {Plane.new}

  describe '#land' do

    it 'lands at an airport' do
      plane.land
      expect(plane.landed).to be_truthy
    end

  end

  describe '#take_off' do

    it 'takes off from an airport' do
      plane.take_off
      expect(plane.landed).to be_falsy
    end

  end

end