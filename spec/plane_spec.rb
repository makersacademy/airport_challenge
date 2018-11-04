require 'plane'

describe Plane do

  let(:plane) { Plane.new }

  describe '#initialize' do
    it 'sets a plane to be in flight by default' do
      expect(plane.in_flight).to eq true
    end
  end

  describe '#ground_plane' do
    it 'user can check if is in flight' do
      plane.ground_plane
      expect(plane.in_flight).to eq false
    end

    it 'user can check if plane is not in flight' do
      plane.unground_plane do
        plane.ground_plane
        plane.unground_plane
        expect(plane.in_flight).to eq true
      end
    end
  end

end
