require 'plane'

describe Plane do
  context 'confirms plane status' do
    it { is_expected.to respond_to :land }
    it 'plane land' do
      subject.land
      expect(subject.land).to be_truthy
    end
    it { is_expected.to respond_to :take_off }
    it 'plane takes off' do
      subject.take_off
      expect(subject.take_off).to be_truthy
    end
  end
end
