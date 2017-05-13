require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to(:land_plane).with(1).argument  }
  it { is_expected.to respond_to(:takeoff_plane).with(1).argument  }

  describe '#land_plane' do
    it 'should allow plane to land at airport' do
      plane = Plane.new
      expect(subject.land_plane(plane)).to eq "#{plane} has completed landing"
    end

    it 'should only allow airborne planes to land' do
      plane = Plane.new
      subject.land_plane(plane)
      expect{subject.land_plane(plane)}.to raise_error{"Plane is already landed"}
    end

    it 'should confirm that plane has landed' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(plane.airborne?).to eq false
    end
  end

  describe '#takeoff_plane' do
    it 'should allow plane to takeoff from airport' do
      plane = Plane.new
      subject.land_plane(plane)
      subject.takeoff_plane(plane)
      expect(plane).to be_airborne
    end

    it 'should only allow landed planes to takeoff' do
      plane = Plane.new
      expect{subject.takeoff_plane(plane)}.to raise_error{"Plane is already airborne"}
    end

    it 'should confirm that plane has taken off' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.takeoff_plane(plane)).to eq "#{plane} has taken off"
    end

  end

end
