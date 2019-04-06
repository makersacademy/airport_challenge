require 'airport'

describe Airport do

  describe '#land_plane' do
    it 'lands a plane' do
      expect(subject).to respond_to(:land_plane).with(1).argument
    end

    it 'stores a plane at the airport' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.planes).to eq [plane]
    end
  end

  describe '#plane_takeoff' do
    it 'confirms plane is no longer in airport' do
      plane = Plane.new
      subject.land_plane(plane)
      subject.plane_takeoff
      expect(subject.planes.empty?).to eq true
    end

    it 'raises an error if the airport is empty' do
      expect{subject.plane_takeoff}.to raise_error("Airport is empty.")
    end
  end

  describe '#empty?' do
    it 'checks if the airport is empty' do
      subject.land_plane(Plane.new)
      expect(subject.empty?).to eq false
    end
  end

end
