require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  before do
    allow(plane).to receive(:land)
    allow(plane).to receive(:take_off)
    allow(airport.send(:weather)).to receive(:stormy?) { false }
  end

  describe '#initialize' do
    it 'creates a airport with default capacity if not specified' do
      expect(airport.capacity).to eq described_class::DEFAULT_CAPACITY
    end
    it 'allows to set a random capacity from 1 to 100' do
      random = rand(100) + 1
      expect(described_class.new(random).capacity).to eq random
    end
  end

  describe '#generate_new_plane' do
    it 'has the generated plane' do
      new_plane = airport.generate_new_plane
      expect(airport.planes).to include new_plane
    end
    it 'does not allow to generate a new plane when the airport is full' do
      airport.capacity.times{ airport.generate_new_plane }
      msg = 'Unable to generate a new plane cause airport is full'
      expect { airport.generate_new_plane }.to raise_error msg
    end
  end

  describe '#land' do
    it 'instructs the plane to land' do
      expect(plane).to receive(:land)
      airport.land plane
    end
    it 'has the plane after it has landed' do
      airport.land plane
      expect(airport.planes).to include plane
    end
    it 'does not allow the plane to land when weather is stormy' do
      allow(airport.send(:weather)).to receive(:stormy?) { true }
      msg = 'Unable to land due to stormy weather'
      expect { airport.land plane }.to raise_error msg
    end
    it 'does not allow the plane to land when the airport is full' do
      airport.capacity.times{ airport.generate_new_plane }
      msg = 'Unable to land cause airport is full'
      expect { airport.land plane }.to raise_error msg
    end
  end

  describe '#take_off' do
    before do
      airport.land plane
    end
    it 'can not instructs a plane to take off if it is not in the airport' do
      airport.take_off plane
      msg = "Unable to instruct plane to take off cause is not in the airport"
      expect { airport.take_off plane }.to raise_error msg
    end
    it 'instructs the plane to take off' do
      expect(plane).to receive(:take_off)
      airport.take_off plane
    end
    it 'does not have the plane after it took off' do
      airport.take_off plane
      expect(airport.planes).not_to include plane
    end
    it 'does not allow the plane to take off when weather is stormy' do
      allow(airport.send(:weather)).to receive(:stormy?) { true }
      msg = 'Unable to take off due to stormy weather'
      expect { airport.take_off plane }.to raise_error msg
    end
  end

end
