require 'airport'

describe Airport do

  describe '#land_plane' do
    it 'respones to land_plane' do
      expect(subject).to respond_to(:land_plane)
    end
    
    it 'adds plane to airport' do
      plane = Plane.new
      subject.land_plane(plane)
      # expect (subject.land_plane(plane)).to eq([plane])
      expect(subject.planes).to include(plane)
    end

  end
end
