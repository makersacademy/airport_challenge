require 'airport'
require 'weather'

describe Airport do

  let(:plane) { double :plane }
  let(:plane2) { double :plane2 }
  let(:plane3) { double :plane3 }

  context 'weather is clear' do
    before(:each) do
      allow(subject).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:land).with(subject)
    end

    it 'allows plane to land and logs landing' do
      subject.land(plane)
      expect(subject.hangar).to include plane
    end

    it 'allows planes to land and logs second landing' do
      allow(plane2).to receive(:land).with(subject)
      subject.land(plane)
      subject.land(plane2)
      expect(subject.hangar).to include plane2
    end

    it 'allows plane to take off and logs the departure' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hangar).not_to include plane
    end

    it 'does not allow the same plane to land twice' do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error('Plane already landed!')
    end

    it 'does not allow planes to take off unless in the airport' do
      expect { subject.take_off(plane) }.to raise_error('Plane not in airport')
    end
  end

  context 'weather is clear but hangar is full' do
    before(:each) do
      allow(subject).to receive(:stormy?).and_return(false)
    end

    it 'raises an error when trying to land_plane' do
      Airport::DEFAULT_CAPACITY.times do
        error_plane = double(:plane)
        allow(error_plane).to receive(:land).with(subject)
        subject.land(error_plane)
      end
      expect { subject.land(plane) }.to raise_error('Cannot land - airport full')
    end
  end

  context 'weather is stormy' do

    it 'does not allow planes to land' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.land(plane) }.to raise_error('Cannot land due to stormy weather')
    end

    it 'does not take off' do
      allow(subject).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:land).with(subject)
      subject.land(plane)
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.take_off(plane) }.to raise_error('Cannot depart due to stormy weather')
    end
  end

  describe '#initialize' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'can take a higher capacity from the user' do
      airport = Airport.new(500)
      expect(airport.capacity).to eq 500
    end

    it 'can take a lower capacity from the user' do
      airport = Airport.new(4)
      expect(airport.capacity).to eq 4
    end

  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
  end

  describe '#stormy?' do

    it { is_expected.to respond_to :stormy? }

    it 'can return true or false' do
      expect(subject.stormy?).to eq(true).or eq(false)
    end

  end

  describe '#full?' do
    before(:each) do
      allow(subject).to receive(:stormy?).and_return(false)
    end
    it { is_expected.to respond_to :full? }

    it 'returns true if at capacity' do
      Airport::DEFAULT_CAPACITY.times do
        capacity_plane = double(:plane)
        allow(capacity_plane).to receive(:land).with(subject)
        subject.land(capacity_plane)
      end
      expect(subject.full?).to eq true
    end

    it 'returns false if fewer planes than capacity' do
      (Airport::DEFAULT_CAPACITY - 1).times do
        capacity_plane = double(:plane)
        allow(capacity_plane).to receive(:land).with(subject)
        subject.land(capacity_plane)
      end
      expect(subject.full?).to eq false
    end
  end

end
