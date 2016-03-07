require 'airplane'

describe Plane do

  subject (:plane) { described_class.new }

  describe '#initialize' do
    it 'initializes as status: nil for new plane' do
      expect(plane.current_status).to eq nil
    end
  end

  describe '#land' do
    it 'initializes as status: landed' do
      plane.land
      expect(plane.current_status).to eq :landed
    end
  end

  describe '#takeoff' do
    it 'initializes as status: inflight for new plane' do
      plane.takeoff
      expect(plane.current_status).to eq :inflight
    end
  end
end
