require 'airport'

describe Airport do
  context '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should allows planes to land' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

    it 'should return landed planes' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.plane).to eq plane
    end

    it 'raises an error when airport is full' do
      subject.land(Plane.new)
      expect { subject.land Plane.new }.to raise_error 'Airport is full'
    end
  end

  context '#take_off' do
    it { is_expected.to respond_to(:take_off) }
    it 'shoud allows planes to take off' do
      plane = subject.take_off
      expect(plane).to be_flying
    end
  end
end
