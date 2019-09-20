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

    it 'raises an error when stormy' do
      subject.weather 
      expect { subject.take_off }.to raise_error 'Take off prevented due to stormy weather'
    end

  end

end
