require 'airport'
require 'plane'

describe Airport do
  before :each do
    @airport = Airport.new
    allow(Weather).to receive(:stormy?) { false }
  end

  describe '#initialize' do
    it 'creates an empty airport' do
      expect(@airport.planes).to be_empty
    end

    it 'can be used without arguments' do
      expect(Airport).to respond_to(:new).with(0).argument
    end

    it 'can be used with an argument' do
      expect(Airport).to respond_to(:new).with(1).argument
    end
  end

  describe '#land' do
    it 'requires an argument' do
      expect(@airport).to respond_to(:land).with(1).argument
    end

    it 'raises an error when trying to land a plane already at the airport' do
      plane = Plane.new
      @airport.land(plane)

      expect { @airport.land(plane) }.to \
      raise_error('Cannot land: Plane is already at Airport')
    end

    it 'can land a plane if weather is not stormy' do
      plane = Plane.new
      @airport.land(plane)

      expect(@airport.planes).to include(plane)
      expect(@airport.planes.size).to eq(1)
    end

    it 'raises an error when a plane tries to land in stormy weather' do
      allow(Weather).to receive(:stormy?) { true }

      expect { @airport.land(Plane.new) }.to raise_error('Cannot land in stormy weather')
    end

    it 'can land planes up to capacity if airport is default' do
      Airport::DEFAULT_CAPACITY.times { @airport.land(Plane.new) }

      expect(@airport.planes.size).to eq(Airport::DEFAULT_CAPACITY)
    end

    it 'raises an error when a plane tries to land and airport is at default max capacity' do
      Airport::DEFAULT_CAPACITY.times { @airport.land(Plane.new) }

      expect { @airport.land(Plane.new) }.to raise_error('Cannot land: Airport is full')
    end

    it 'can land planes up to capacity if airport is custom' do
      custom_capacity = Airport::DEFAULT_CAPACITY + 5
      airport = Airport.new(custom_capacity)
      custom_capacity.times { airport.land(Plane.new) }

      expect(airport.planes.size).to eq(custom_capacity)
    end

    it 'raises an error when a plane tries to land and airport is at custom max capacity' do
      custom_capacity = Airport::DEFAULT_CAPACITY + 5
      airport = Airport.new(custom_capacity)
      custom_capacity.times { airport.land(Plane.new) }

      expect { airport.land(Plane.new) }.to raise_error('Cannot land: Airport is full')
    end
  end

  describe '#take_off' do
    it 'requires an argument' do
      expect(@airport).to respond_to(:take_off).with(1).argument
    end

    it 'raises an error when trying to take off a plane not at the airport' do
      expect { @airport.take_off(Plane.new) }.to \
      raise_error('Cannot take off: Plane is not at Airport')
    end

    it 'can take off a plane if weather is not stormy' do
      plane_1 = Plane.new
      plane_2 = Plane.new
      plane_3 = Plane.new
      @airport.planes << plane_1 << plane_2 << plane_3
      @airport.take_off(plane_2)

      expect(@airport.planes).not_to include(plane_2)
      expect(@airport.planes.size).to eq(2)
    end

    it 'raises an error when a plane tries to take off in stormy weather' do
      plane = Plane.new
      @airport.planes << plane
      allow(Weather).to receive(:stormy?) { true }

      expect { @airport.take_off(plane) }.to raise_error('Cannot take off in stormy weather')
    end
  end
end
