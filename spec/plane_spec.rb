require 'plane'

describe Plane do
  it 'can create instance of Plane' do
    plane = Plane.new
    expect(plane).to be_kind_of(Plane)
  end

  describe '#flying' do
    it { is_expected.to respond_to :flying? }

    it 'sets a plane as flying' do
      subject.flying?
      expect(subject).to be_flying
    end
  end
end
