require 'airport'
require 'plane'

describe Airport do
  describe '#stormy?' do
    it 'returns true if weather stormy' do
      allow(subject).to receive(:stormy?) { "stormy" }
      expect(subject).to be_stormy
    end
  end
  describe '#full?' do
    it 'stops planes from landing' do
      subject.capacity.times { subject.add_plane(Plane.new) }
      expect(subject).to be_full
    end
  end
  describe '#add_plane' do
    it 'adds plane to apron' do
      expect(subject.add_plane(Plane.new)).to eql subject.apron
    end
    it 'raises error if full' do
      allow(subject).to receive(:full?) { true }
      expect { subject.add_plane(Plane.new) }.to raise_error("Airport is at capacity")
    end
  end
  describe '#remove_plane' do
    it 'deletes planes from apron' do
      plane = Plane.new
      subject.apron << plane
      expect(subject.remove_plane(plane)).to eql plane
    end
  end
end
