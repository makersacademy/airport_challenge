require "plane"

describe Plane do
  subject(:plane) { described_class.new }

  it { is_expected.to(respond_to(:landed?)) }
  it { is_expected.to(respond_to(:land_plane)) }
  it { is_expected.to(respond_to(:fly)) }

  describe '#landed?' do
    it 'does not return true when a plane is flying' do
      expect(plane.landed?).not_to(eq(true))
    end
    it 'returns true when a plane has landed' do
      plane.land_plane
      expect(plane.landed?).to(eq(true))
    end
  end

  describe '#land_plane' do
    it 'updates the landed status to true' do
      plane.land_plane
      expect(plane.landed?).to(eq(true))
    end
  end

  describe '#fly' do
    it 'updates the landed status to false' do
      plane.fly
      expect(plane.landed?).to(eq(false))
    end
  end

end
