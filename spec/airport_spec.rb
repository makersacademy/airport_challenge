require './lib/airport'

describe Airport do
  context 'Airport allows plane to land' do
    it 'returns true if plane lands' do
      # removed due to useless assignment
      # plane = Plane.new
      expect(subject.land_plane).to be true
    end

    context 'Airport allows plane to take off' do
      it 'returns true after takeoff' do
        expect(subject.take_off).to be true
      end
    end
    context 'Airport allows plane to take off' do
      it 'removes the instance of plane from Airport' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.hanger).not_to include(plane)
      end
    end
  end
end
