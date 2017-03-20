require 'plane'

describe Plane do
subject(:plane) { described_class.new }

  describe '#plane_status' do
    it { is_expected.to respond_to(:plane_status) }

    it 'should update to true if airborne' do
      expect(plane.plane_status(:airborne)).to eq true
    end

    it 'should update to false if landed' do
      expect(plane.plane_status(:landed)).to eq false
    end
  end

end
