# understading airport object
require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  describe ' #initialize' do
    it { is_expected.to respond_to :plane }
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
      expect(airport.plane).to be plane
    end

    it 'raise an error when airport is full' do
      airport.land(plane)
      plane1 = Plane.new
      expect { airport.land(plane1) } .to raise_error('Airport is full now')
    end

    it 'raise an error when air is stormy' do
      allow(airport).to receive(:rand).and_return 15
      expect { airport.land(plane) } .to raise_error('air is stormy')
    end
  end

  describe ' #takeoff' do
    it { is_expected.to respond_to(:takeoff) }

    it 'confirm that plane which is taken off flyies' do
      airport.land(plane)
      expect(airport.takeoff).to be_flying
    end

    it 'raise an error when air is stormy' do
      allow(airport).to receive(:rand).and_return 15
      expect { airport.takeoff } .to raise_error('air is stormy')
    end

  end

end
