require 'airport'
require 'plane'
require 'weather'

describe Airport do

  plane = Plane.new

  describe '#land_plane in sunny weather' do
    sunny = "sunny"
    it 'hangar receives a plane' do
      subject.land_plane(plane, sunny)
      expect(subject.hangar).to include(plane)
    end

    it 'throws error if hangar is full' do
      plane2 = Plane.new
      subject.land_plane(plane2, sunny)
      plane3 = Plane.new
      subject.land_plane(plane3, sunny)

      expect { subject.land_plane(plane, sunny) }.to raise_error 'No space in hangar'
    end
  end

  describe '#land_plane in stormy weather' do
    it 'prevents landing when weather is stormy' do
      stormy = Weather.new
      allow(stormy).to receive(:forecast).and_return("stormy")
      expect { subject.land_plane(plane, stormy) }.to raise_error "You can't land plane"
    end
  end

  describe '#take_off in sunny weather' do
    sunny = "sunny"

    before do
      subject.land_plane(plane, sunny)
      subject.take_off(plane, sunny)
    end

    it 'removes plane from hangar' do
      expect(subject.hangar).not_to include(plane)
    end

    it 'confirms no plane in hangar' do
      expect(subject.take_off(plane, sunny)).to eq("No planes in hangar")
    end
  end

  describe '#take_off in stormy weather' do

    it 'prevents take off when weather is stormy' do
      stormy = Weather.new
      allow(stormy).to receive(:forecast).and_return("stormy")
      expect { subject.take_off(plane, stormy) }. to raise_error "You can't take off"
    end
  end

end
