require 'airport'

describe Airport do
  describe '#launch_plane' do
    it 'launches a plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.launch_plane).to eq plane
    end

    it 'raises an error when there are no planes available' do
      expect { subject.launch_plane }.to raise_error 'Airport is empty'
    end
  end

  describe '#land' do
    it 'shows planes in airport' do
      expect(subject).to respond_to :planes
    end

    it 'lands a plane' do
      expect(subject).to respond_to(:land).with(1).arguments
    end

    it 'raises an error when full' do
      #weather = Weather.new
      #weather.storm? == false
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'Airport at full capacity'
    end
  end
end
