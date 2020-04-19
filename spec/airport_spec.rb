# understading airport object
require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  describe ' #initialize' do
    it { is_expected.to respond_to :planes }
    it { is_expected.to respond_to :capacity }
    it 'set the default capacity:10' do
      airport = Airport.new(10)
      expect(airport.capacity).to eq 10
    end
  end

  describe ' #land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'is instruct a plane to land' do
      airport.land(plane)
      expect(airport.planes[0]).to be plane
    end

    it 'raise an error when airport is full' do
      allow(airport).to receive(:rand).and_return 0
      Airport::DEFAULT_CAPACITY.times { airport.land(plane = Plane.new) }
      expect { airport.land(plane) }.to raise_error('Airport is full now')
    end

    it 'raise an error when air is stormy' do
      allow(airport).to receive(:rand).and_return 15
      expect { airport.land(plane) }.to raise_error('air is stormy')
    end

    it 'when plane lands, status:taxi' do
      airport.land(plane)
      expect(plane.status).to eq 'taxi'
    end

    it 'plane which is status taxi cannot land' do
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error('plane is in apron')
    end


  end

  describe ' #takeoff' do
    it { is_expected.to respond_to(:takeoff) }

    it 'confirm that plane which is taken off flyies' do
      airport.land(plane)
      expect(airport.takeoff).to be_flying
    end
    it 'raise an error when no airplane at airport' do
      allow(airport).to receive(:rand).and_return 0
      expect { airport.takeoff } .to raise_error('no airplane at airport')
    end

    it 'raise an error when air is stormy' do
      allow(airport).to receive(:rand).and_return 15
      expect { airport.takeoff } .to raise_error('air is stormy')
    end

    it 'when plane takes off, status:flying' do
      airport.land(plane)
      airport.takeoff
      expect(plane.status).to eq 'flying'
    end

  end

end
