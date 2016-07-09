require 'airport'

describe Airport do

  describe '#land_plane' do
      it 'lands a plane' do
      plane = Airplane.new
      expect(subject.land(plane)).to eq [plane]
    end
  end

    describe '#take_off' do
      it 'instructs the plane to take off from the Airport' do
        plane = Airplane.new
        subject.land(plane)
        expect(subject.take_off).to eq plane
      
      end
    end
end
