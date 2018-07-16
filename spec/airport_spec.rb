require 'airport'

describe Airport do
  describe '#launch_plane' do
    it 'launches a plane' do
      Weather.new.stormy? == false
      plane = Plane.new
      subject.land(plane)
      expect(subject.launch_plane).to eq plane
    end

#    it 'raises and error when stormy' do
#      weather = Weather.new
#      plane = Plane.new
#      subject.land(plane)
#      Weather.new.stormy?
#      expect { subject.launch_plane }.to raise_error 'There is a storm, cannot launch plane'
#    end

    it 'raises an error when there are no planes available' do
      expect { subject.launch_plane }.to raise_error 'Airport is empty'
    end
  end

  describe '#land' do
    it 'shows planes in airport' do
      expect(subject).to respond_to :planes
    end

    it 'lands a plane' do
      Weather.new.stormy? == false
      expect(subject).to respond_to(:land).with(1).arguments
    end

    it 'raises an error when full' do
      Weather.new.stormy? == false
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'Airport at full capacity'
    end

    it 'raises and error when stormy' do
#      Weather.new.stormy? == true
#      expect { subject.land(Plane.new) }.to raise_error 'There is a storm, cannot land plane'
    end
  end
end
