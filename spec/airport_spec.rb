require 'airport'

describe Airport do
  let(:airport) { described_class.new }
  it 'responds to land_plane method' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it 'responds to take_off method' do
    expect(subject).to respond_to(:take_off)
  end

  describe '#land_plane' do
    it 'allows airport to accept a plane and store it' do
      plane = Plane.new
      airport.land_plane(plane)
      expect(airport.planes).to include(plane)
    end

    it 'accepts instances of Plane class' do
      plane = Plane.new
      airport.land_plane(plane)
      expect(airport.planes[-1]).to be_instance_of Plane
    end

    it 'raises error when airport is full' do
      plane = Plane.new
      airport.capacity.times { airport.land_plane(plane) }
      expect { airport.land_plane(plane) }.to raise_error 'Airport full!'
    end
  end

  describe '#take_off' do
    it 'removes a plane from the airport' do
      plane = Plane.new
      airport.land_plane(plane)
      expect(airport.take_off).to be_instance_of Plane
    end

    it 'throws error when no planes left in airport' do
      expect { airport.take_off }.to raise_error 'No planes left!'
    end
  end

end
