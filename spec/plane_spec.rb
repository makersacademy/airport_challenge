require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it { expect(plane).to respond_to :landed? }

  describe 'landing' do
    it 'should return its landed status' do
      plane.landed = true
      expect(plane.landed?).to eq(true)
    end
  end
end
