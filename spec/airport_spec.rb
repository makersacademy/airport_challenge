require 'airport'

describe Airport do

  describe '#land_plane' do
    it 'lands a plane' do
      allow(subject.weather).to receive(:stormy?) { :sunny }
      plane = Plane.new
      expect(subject.land_plane(plane)).to eq [plane]
    end
    it 'Doesnt land a plane if the airport is full' do
      allow(subject.weather).to receive(:stormy?) { :sunny }
      plane = Plane.new
      subject.land_plane(plane)
      plane2 = Plane.new
      expect { subject.land_plane(plane2) }.to raise_error 'The airport is full'
    end
    it 'Doesnt land a plane if the weather is bad' do
      allow(subject.weather).to receive(:stormy?) { :stormy }
      expect { subject.land_plane(Plane.new) }.to raise_error 'The weather is stormy'
    end
  end

  describe '#release_plane' do
    it 'releases the correct plane' do
      allow(subject.weather).to receive(:stormy?) { :sunny }
      subject.capacity = 2
      plane_one = Plane.new
      plane_two = Plane.new
      subject.land_plane(plane_one)
      subject.land_plane(plane_two)
      expect(subject.release_plane).to eq plane_two
    end
    it 'doesnt release a plane in bad weather' do 
      allow(subject.weather).to receive(:stormy?) { :sunny }
      plane = Plane.new
      subject.land_plane(plane)
      allow(subject.weather).to receive(:stormy?) { :stormy }
      expect { subject.release_plane }.to raise_error 'The weather is stormy'
    end
  end

  describe '#empty?' do
    it 'confirms the airport is empty' do
      allow(subject.weather).to receive(:stormy?) { :sunny }
      plane = Plane.new
      subject.land_plane(plane)
      subject.release_plane
      expect(subject.empty?).to eq 'There are no planes in the hanger'
    end
  end

  describe '#full?' do
    it 'lets us know the airport is full' do
      allow(subject.weather).to receive(:stormy?) { :sunny }
      subject.capacity = 1
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.full?).to eq :full
    end
  end

  describe '#capacity' do
    it 'Can be changed if necessary' do
      subject.capacity = 10
      expect(subject.capacity).to eq 10
    end
  end
end
