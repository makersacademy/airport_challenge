require './lib/airport'

describe Airport do
  context 'allows plane to land' do
    it 'returns true if plane lands' do
      plane = Plane.new
      expect(subject.land_plane(plane)).to be true
    end

    context 'allows plane to take off' do
      it 'returns true after takeoff' do
        plane = Plane.new
        expect(subject.take_off(plane)).to be true
      end

      it 'removes the instance of plane from Airport' do
        plane = Plane.new
        subject.land_plane(plane)
        subject.take_off(plane)
        expect(subject.hanger).not_to include(plane)
      end

      it 'rejects landing a plane if at capacity' do
        10.times {subject.land_plane(Plane.new)}
        expect {subject.land_plane(Plane.new)}.to raise_error "Landing reject, over capacity"
      end
    end
  end
end
