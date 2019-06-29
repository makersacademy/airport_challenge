require 'airport'
require 'plane'
require 'weather'

describe Airport do
  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it { is_expected.to respond_to(:takeoff_plane) }
  describe '#land_plane' do
    it 'stores planes' do
      plane = Plane.new
      expect(subject.land_plane(plane)).to eq plane
    end
  end

  describe '#takeoff_plane' do
    it 'releases planes' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.takeoff_plane).to eq 'Plane has taken off'
    end
    it 'does not release planes when no planes are stored' do
      expect { subject.takeoff_plane }.to raise_error 'No planes available for takeoff'
      plane = Plane.new
      subject.land_plane(plane)
      subject.takeoff_plane
      expect { subject.takeoff_plane }.to raise_error 'No planes available for takeoff'
    end  
  end
end
