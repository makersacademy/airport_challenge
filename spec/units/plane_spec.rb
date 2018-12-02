require 'plane'

RSpec.describe Plane do
  describe '#land' do
    it 'sets flying to false' do
      plane = Plane.new

      expect(plane.land).to eq false
    end
    it 'raises error if already landed' do
      plane = Plane.new
      plane.land

      expect { plane.land }.to raise_error('Already landed')
    end
  end

  describe '#takeoff' do
    it 'sets flying to true' do
      plane = Plane.new
      plane.land

      expect(plane.takeoff).to eq true
    end

    it 'raises error if already taken off' do
      plane = Plane.new

      expect { plane.takeoff }.to raise_error('Already taken off')
    end
  end

end
