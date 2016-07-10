require "plane"

describe Plane do
  subject(:plane) { described_class.new }

  it { is_expected.to(respond_to(:landed?)) }
  it { is_expected.to(respond_to(:land_plane)) }
  it { is_expected.to(respond_to(:fly)) }

  describe '#landed?' do
    it 'does not return true when a plane is flying' do
      expect(subject.landed?).not_to(eq(true))
    end
    it 'returns true when a plane has landed' do
      subject.land_plane
      expect(subject.landed?).to(eq(true))
    end
  end

  describe '#land_plane' do
    it 'updates the landed status to true' do
      subject.land_plane
      expect(subject.landed?).to(eq(true))
    end
  end

end
