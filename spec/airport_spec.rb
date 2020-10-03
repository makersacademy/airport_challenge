require 'airport'

describe Airport do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'releases planes' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq(plane)
    end
  end

end
