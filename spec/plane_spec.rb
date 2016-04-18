require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it { expect(plane).to respond_to :landed? }

  describe 'landing' do
    it 'should change landed status' do
      expect(plane.land).to eq(true)
    end

    it 'should return its landed status' do
      plane.land
      expect(plane.landed?).to eq(true)
    end
  end

  describe 'departing' do
    it 'should change landed status' do
      expect(plane.depart).to eq(false)
    end
  end
end
