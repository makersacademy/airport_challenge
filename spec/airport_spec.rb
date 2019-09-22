require 'Airport'

describe Airport do

  describe '#land_plane' do

    it { is_expected.to respond_to :land_plane }

    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land_plane(plane)).to eq plane
    end

    it 'raises an errory when stormy' do
      plane = Plane.new
      subject.weather
      expect { subject.land_plane(plane) }.to raise_error 'Landing prevented due to stormy weather'
    end

    it { is_expected.to respond_to :plane }

    it 'returns a landed plane' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.plane).to eq plane
    end

    it 'raises an error when airport has max. capacity 1' do
      subject.land_plane(Plane.new)
      expect { subject.land_plane(Plane.new) }.to raise_error 'Airport full'
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
