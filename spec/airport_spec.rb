require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }

  describe '#land' do
    it 'lands plane' do
      plane = Plane.new
      allow(subject).to receive(:stormy?) { false }
      expect(subject.land(plane)).to eq [plane]
    end

    it "raises error when airport is full" do
      allow(subject).to receive(:stormy?) { false }
      20.times { subject.land Plane.new }
      expect { subject.land(Plane.new) }.to raise_error("airport is full")
    end

    it "raises an error when airport is stormy" do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(Plane.new) }.to raise_error("dangerous weather!")
    end
  end

  describe '#take_off' do
    it 'allows plane to take off' do
      plane = Plane.new
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it "raises error when airport is empty" do
      expect { subject.take_off }.to raise_error("airport is empty")
    end

    it "raises an error when airport is stormy" do
      allow(subject).to receive(:stormy?) { false }
      subject.land(Plane.new)
      allow(subject).to receive(:stormy?) { true }
      expect { subject.take_off }.to raise_error("dangerous weather!")
    end
  end

end
