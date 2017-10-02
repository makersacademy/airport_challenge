require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  describe '#land' do

    it 'lands at an airport' do
      plane.land
      expect(plane.landed).to be_truthy
    end
    it 'raises error if already landed' do
      plane.land
      expect { plane.land }.to raise_error 'plane has already landed'
    end

  end

  describe '#take_off' do

    it 'takes off from an airport' do
      plane.land
      plane.take_off
      expect(plane.landed).to be_falsy
    end
    it 'raises error if already in the air and attempting to take off' do
      expect { plane.take_off }.to raise_error 'plane is already in the air'
    end

  end

end
