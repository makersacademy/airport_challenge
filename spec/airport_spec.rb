require 'airport'

describe Airport do

  let(:plane) { double('plane') }

  describe '#initialize' do

    it 'creates the airport with an empty array of planes' do
      expect(subject.planes).to eq []
    end

    it 'creates an airport with a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    let(:airport) { Airport.new(12) }

    it 'accepts a capacity argument and stores it' do
      expect(airport.capacity).to eq 12
    end

  end

  describe '#port_plane' do

    it 'ports planes in the airport' do
      Airport::DEFAULT_CAPACITY.times { subject.port_plane(double('plane')) }
      expect(subject.planes.length).to eq Airport::DEFAULT_CAPACITY
    end

    it 'stores planes in the airport array' do
      subject.port_plane(plane)
      expect(subject.planes).to include plane
    end

  end

  describe '#release_plane' do
    it 'releases the plane from the airport' do
      subject.release_plane(plane)
      expect(subject.planes).not_to include plane
    end
  end

end
