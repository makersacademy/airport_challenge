require 'airport'

describe Airport do
  it { is_expected.to respond_to(:recieve_plane).with(1).argument }
  it { is_expected.to respond_to(:release_plane) }

  describe '#recieve_plane' do
    it 'recieves plane' do
      plane = Plane.new
      allow(subject).to receive(:stormy?) { false }
      expect(subject.recieve_plane(plane)).to eq [plane]
    end

    it "raises error when airport is full" do
      allow(subject).to receive(:stormy?) { false }
      20.times { subject.recieve_plane Plane.new }
      expect { subject.recieve_plane(Plane.new) }.to raise_error("airport is full")
    end

    it "raises an error when stormy" do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.recieve_plane(Plane.new) }.to raise_error("dangerous weather!")
    end
  end

  describe '#release_plane' do
    it 'releases plane' do
      plane = Plane.new
      subject.recieve_plane(plane)
      expect(subject.release_plane).to eq plane
    end

    it "raises error when airport is empty" do
      expect { subject.release_plane }.to raise_error("airport is empty")
    end

    it "raises an error when stormy" do
      subject.recieve_plane(Plane.new)
      allow(subject).to receive(:stormy?) { true }
      expect { subject.release_plane }.to raise_error("dangerous weather!")
    end
  end

end
