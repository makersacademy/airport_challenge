require 'airport'

describe Airport do

  describe '#land_plane' do
    it 'respones to land_plane' do
      expect(subject).to respond_to(:land_plane)
    end

    it 'adds plane to airport' do
      @plane = Plane.new
      subject.land_plane(@plane)
      # expect (subject.land_plane(plane)).to eq([plane])
      expect(subject.planes).to include(@plane)
    end
  end

  describe '#take_off' do
    it 'respones to take_off' do
      expect(subject).to respond_to(:take_off)
    end
    it 'removes plane from airport' do
      subject.take_off
    end
    it 'confirms no planes are in the airport' do
      expect(subject.planes).to eq([])
    end
  end

end
