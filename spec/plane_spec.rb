require 'plane'

describe Plane do
  it 'can create instance of Plane' do
    plane = Plane.new
    expect(plane).to be_kind_of Plane
  end

  it { is_expected.to respond_to :flying? }
  it { is_expected.to respond_to :set_as_flying }
  it { is_expected.to respond_to :set_as_landed }

  describe '#initialize' do
    it 'initializes the plane to be flying' do
      expect(subject.flying).to be true
    end
  end

  describe '#set_as_flying' do
    it 'sets a plane as flying' do
      subject.set_as_flying
      expect(subject).to be_flying
    end
  end

  describe '#set_as_landed' do
    it 'sets a plane as landed' do
      subject.set_as_landed
      expect(subject.flying).not_to be
    end
  end
end
