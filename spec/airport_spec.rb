require 'airport'

describe Airport do

  describe '#land_plane' do
    it 'lands a plane' do
      allow(subject).to receive(:weather) { 'Sunny' }
      plane = Plane.new
      expect(subject.land_plane(plane)).to eq [plane]
    end
    it 'Doesnt land a plane if the airport is full' do
      allow(subject).to receive(:weather) { 'Sunny' }
      plane = Plane.new
      subject.land_plane(plane)
      plane2 = Plane.new
      expect(subject.land_plane(plane2)).to eq 'The airport is full'
    end
    it 'Doesnt land a plane if the weather is bad' do
      allow(subject).to receive(:weather) { 'Stormy' }
      plane = Plane.new
      expect(subject.land_plane(plane)).to eq 'The weather is bad'
    end
  end

  describe '#release_plane' do
    it 'releases a plane' do
      allow(subject).to receive(:weather) { 'Sunny' }
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.release_plane).to eq plane
    end
    it 'doesnt release a plane in bad weather' do 
      allow(subject).to receive(:weather) { 'Stormy' }
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.release_plane).to eq "The weather is bad, you cant take off"
    end
  end

  describe '#empty?' do
    it 'confirms the airport is empty' do
      plane = Plane.new
      subject.land_plane(plane)
      subject.release_plane
      expect(subject.empty?).to eq 'There are no planes in the hanger'
    end
  end

  describe '#full?' do
    it 'lets us know the airport is full' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.full?).to eq 'Full'
    end
  end

  describe '#capacity' do
    it 'Can be changed if necessary' do
      subject.capacity = 10
      expect(subject.capacity).to eq 10
    end
  end

  describe '#weather' do
    it 'returns a random weather event' do
      expect(subject.weather).to eq 'Sunny' || 'Stormy'
    end
  end
end
