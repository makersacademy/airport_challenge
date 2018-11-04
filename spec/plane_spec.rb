require 'plane'

describe Plane do

  let(:plane) { Plane.new }

  describe '#initialize' do
    it 'sets a plane to be in flight by default' do
      expect(plane.in_flight).to eq true
    end
  end

  describe '#ground_plane' do
    it 'user can check if plane has landed' do
      plane.ground_plane
      expect(plane.in_flight).to eq false
    end
  end

end
