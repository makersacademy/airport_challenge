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
      allow(airport).to receive(:rand).and_return 0
      airport.land(plane)
      expect(airport.planes[0]).to be plane
    end

    it 'raise an error when airport is full' do
      allow(airport).to receive(:rand).and_return 0
      Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
      expect { airport.land(plane) }.to raise_error('Airport is full now')
    end

    it 'raise an error when air is stormy' do
      allow(airport).to receive(:rand).and_return 15
      expect { airport.land(plane) }.to raise_error('air is stormy')
    end

    it 'when plane lands, status:taxi' do
      allow(airport).to receive(:rand).and_return 0
      airport.land(plane)
      expect(plane.status).to eq 'taxi'
    end

    it 'plane which is status taxi cannot land' do
      allow(airport).to receive(:rand).and_return 0
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error('plane is in apron')
    end

  end

  describe ' #takeoff' do
    it { is_expected.to respond_to(:takeoff) }

    it 'confirm that plane which is taken off flyies' do
      allow(airport).to receive(:rand).and_return 0
      airport.land(plane)
      airport.takeoff(plane)
      expect(plane.status).to eq 'flying'
    end

    it 'raise an error when air is stormy' do
      airport.land(plane)
      allow(airport).to receive(:rand).and_return 15
      expect { airport.takeoff(plane) }.to raise_error('air is stormy')
    end

    it 'raise an error when airplane is from another airport' do
      airport2 = Airport.new
      allow(airport2).to receive(:rand).and_return 0
      airport2.land(plane)
      allow(airport).to receive(:rand).and_return 0
      expect { airport.takeoff(plane) }.to raise_error('this plane is currently in another airport')
    end

    it 'when plane takes off, status:flying' do
      allow(airport).to receive(:rand).and_return 0
      airport.land(plane)
      airport.takeoff(plane)
      expect(plane.status).to eq 'flying'
    end

    it 'plane which is status flying cannot takeoff' do
      allow(airport).to receive(:rand).and_return 0
      expect { airport.takeoff(plane) }.to raise_error('plane is flying')
    end

  end

end
