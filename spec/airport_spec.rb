require './lib/airport'

describe Airport do
  context 'allows plane to land' do
    it 'returns true if plane lands' do
       plane = Plane.new
      expect(subject.land_plane(plane)).to be true
    end

    context 'allows plane to take off' do
      it 'returns true after takeoff' do
        expect(subject.take_off).to be true
      end
    end
    context 'allows plane to take off' do
      it 'removes the instance of plane from Airport' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.hanger).not_to include(plane)
      end
    end
  end
end
