require 'Airport'

describe Airport do

  describe '#land_plane' do

    it { is_expected.to respond_to :land_plane }

    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land_plane(plane)).to eq plane
    end
  end

  describe '#take_off' do

    it { is_expected.to respond_to :take_off }

    it 'plane takes off' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.take_off).to eq "The plane has taken off"
    end
  end

end
