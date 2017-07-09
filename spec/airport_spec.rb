require 'airport'

describe Airport do
  describe 'instructs plane to land' do
    it { is_expected.to respond_to :land }
    it { is_expected.to respond_to(:land_plane).with(1).argument }
    it { is_expected.to respond_to(:plane) }

    it 'land' do
      plane = subject.land
      expect(plane.landed?).to be_truthy
    end
    it 'lands plane' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.plane).to eq plane
    end
  end
  describe 'instructs plane to land' do
    it { is_expected.to respond_to :take_off }
    it { is_expected.to respond_to(:plane_depart).with(1).argument }
    it { is_expected.to respond_to(:plane) }

    it 'depart' do
      plane = subject.take_off
      expect(plane.departed?).to be_truthy
    end
    it 'plane departs' do
      plane = Plane.new
      subject.plane_depart(plane)
      expect(subject.plane).to eq plane
    end
  end
end
