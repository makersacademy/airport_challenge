require 'airport'

describe Airport do

  let(:weather) { double :weather, :stormy= => true, stormy?: true }

  describe '#land_plane' do

    it { is_expected.to respond_to :land_plane }

    it { is_expected.to respond_to(:land_plane).with(1).argument }

    it 'lands a plane' do
      plane = Plane.new
      subject.stormy = false
      expect(subject.land_plane(plane)).to eq subject.planes
    end

    it 'raises an error when stormy - prevents plane landing' do
      plane = Plane.new
      subject.stormy = true
      expect { subject.land_plane(plane) }.to raise_error 'Landing prevented due to stormy weather'
    end

    it { is_expected.to respond_to :planes }

    it 'returns a landed plane' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.planes).to eq subject.planes
    end

    it 'raises an error when airport hits max capacity' do
      subject.capacity.times { subject.land_plane(Plane.new) }
      expect { subject.land_plane(Plane.new) }.to raise_error 'Airport full'
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::AIRPORT_CAPACITY
    end

    it 'has a variable capacity' do
      airport = Airport.new(150)
      150.times { airport.land_plane(Plane.new) }
      expect { airport.land_plane(Plane.new) }.to raise_error 'Airport full'
    end

    it 'defaults capacity' do
      plane = Plane.new
      Airport::AIRPORT_CAPACITY.times { subject.land_plane(plane) }
      expect { subject.land_plane(plane) }.to raise_error 'Airport full'
    end

  end

  describe '#take_off' do

    it { is_expected.to respond_to :take_off }

    it 'plane takes off' do
      plane = Plane.new
      subject.stormy = false
      subject.land_plane(plane)
      expect(subject.take_off).to eq 'The plane has taken off'
    end

    it 'raises an error when stormy - prevents plane taking off' do
      subject.stormy = true
      expect { subject.take_off }.to raise_error 'Take off prevented due to stormy weather'
    end

  end

end
