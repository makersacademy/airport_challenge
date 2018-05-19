require './lib/airport'

describe Airport do
  describe '#land_plane' do
  it 'responds to land_plane' do
    expect(Airport.new).to respond_to(:land_plane)
  end
  it 'responds to land_plane with one argument' do
      expect(Airport.new).to respond_to(:land_plane).with(1).argument
    end
  it 'allows plane to land in airport' do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.planes).to include(plane)
  end
end
  describe '#take_off' do
      it 'responds to take_off' do
        expect(Airport.new).to respond_to(:take_off)
      end
      it 'allows plane to leave airport' do
        plane = Plane.new
        subject.land_plane(plane)
        subject.take_off
        expect(subject.planes).not_to include(plane)
      end
      it 'prevents take_off when stormy' do
        plane = Plane.new
        subject.land_plane(plane)
        subject.stormy?
        expect {subject.take_off}.to raise_error "Stormy weather"
      end
  end
end
