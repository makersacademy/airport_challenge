require 'plane'

describe Plane do
  let(:plane) { Plane.new }

  it 'can be created' do
    expect(Plane.new).to be_kind_of(Plane)
  end

  describe '#land' do
    it 'can respond to land' do
      expect(plane).to respond_to(:land)
    end

    it 'can change the flying status' do
      plane.land

      expect(plane.flying?).to eq(false)
    end
  end

  describe '#flying?' do
    it 'can respond to flying' do
      expect(plane).to respond_to(:flying?)
    end
  end
end
