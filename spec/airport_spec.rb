require 'airport'
require 'weather'

describe Airport do

  context 'weather is clear' do
    before(:each) do
      @plane = Plane.new
      @plane2 = Plane.new
    end

    it 'allows plane to land and logs landing' do
      expect(subject).to receive(:stormy?).and_return(false)
      subject.land(@plane)
      expect(subject.hangar).to include @plane
    end

    it 'allows planes to land and logs second landing' do
      2.times { expect(subject).to receive(:stormy?).and_return(false) }
      subject.land(@plane)
      subject.land(@plane2)
      expect(subject.hangar).to include @plane2
    end

    it 'allows plane to take off and logs the departure' do
      2.times { expect(subject).to receive(:stormy?).and_return(false) }
      subject.land(@plane)
      subject.take_off(@plane)
      expect(subject.hangar).not_to include @plane
    end

    it 'does not allow the same plane to land twice' do
      2.times { allow(subject).to receive(:stormy?).and_return(false) }
      subject.land(@plane)
      expect { subject.land(@plane) }.to raise_error('Plane already landed!')
    end

    it 'does not allow planes to take off unless in the airport' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect { subject.take_off(@plane) }.to raise_error('Plane not in airport')

    end
  end

  context 'weather is clear but hangar is full' do

    it 'raises an error when trying to land_plane' do
      # ok that this is allow rather than expect?
      100.times { allow(subject).to receive(:stormy?).and_return(false) }
      100.times { subject.land(Plane.new) }
      plane = Plane.new
      expect { subject.land(plane) }.to raise_error('Cannot land - airport full')
    end
  end

  context 'weather is stormy' do
    before(:each) do
      @plane = Plane.new
    end

    it 'does not allow planes to land' do
      expect(subject).to receive(:stormy?).and_return(true)
      expect { subject.land(@plane) }.to raise_error('Cannot land due to stormy weather')
    end

    it 'does not take off' do
      subject.land(@plane)
      expect(subject).to receive(:stormy?).and_return(true)
      expect { subject.take_off(@plane) }.to raise_error('Cannot depart due to stormy weather')
    end
  end

  describe '#initialize' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'can take a capacity from the user' do
      airport = Airport.new(5000)
      expect(airport.capacity).to eq 5000
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

    it { is_expected.to respond_to :full? }

    it 'returns true if at capacity' do
      100.times { expect(subject).to receive(:stormy?).and_return(false) }
      100.times { subject.land(Plane.new) }
      expect(subject.full?).to eq true
    end

    it 'returns false if fewer planes than capacity' do
      64.times { expect(subject).to receive(:stormy?).and_return(false) }
      64.times { subject.land(Plane.new) }
      expect(subject.full?).to eq false
    end
  end

  describe 'change capacity' do

    it 'changes capacity to 400' do
      airport = Airport.new(50)
      airport.capacity = 400
      expect(airport.capacity).to eq 400
    end
  end

end
