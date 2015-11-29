require 'plane'

describe Plane do
  describe '#land' do
    it { is_expected.to respond_to(:land) }
    before do
      subject.take_off
    end
    it 'sets flying status to false' do
      subject.land
      expect(subject.flying?).to be false
    end
    it 'can not land when is not flying' do
      subject.land
      message = 'Unable to land cause is not flying'
      expect { subject.land }.to raise_error message
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }
    it 'sets flying status to true' do
      subject.take_off
      expect(subject.flying?).to be true
    end
  end
end
