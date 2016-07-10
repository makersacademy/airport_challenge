require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it { is_expected.to respond_to(:takeoff_plane).with(1).argument }

  context 'landing' do
    plane = Plane.new

    it 'lands a plane' do
      expect(subject.land_plane(plane)).to eq plane
    end

    it 'registers plane as having landed' do
      expect(subject.land_plane(plane)).to be_landed
    end
  end

  context 'taking off' do
    plane = Plane.new

    it 'takes off a plane' do
      expect(subject.takeoff_plane(plane)).to eq plane
    end

    it 'registers plane as having taken off' do
      expect(subject.takeoff_plane(plane)).to be_takenoff
    end
  end

end # end describe airport
