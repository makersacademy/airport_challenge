require 'airport'
require 'plane'

describe Airport do

  let!(:plane) { Plane.new }

  before(:each) do
    allow(subject).to receive(:stormy?) { false }
  end

  describe 'planes' do
    it { expect(subject).to respond_to(:planes) }
  end

  describe 'capacity' do
    it { expect(subject).to respond_to(:capacity) }
    it 'if not otherwise set up, capacity should be default' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe 'full?' do
    it { expect(subject).to respond_to(:full?) }
    it 'returns true when airport is at capacity' do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect(subject.full?).to eq true
    end
    it 'returns false when airport is under capacity' do
      (Airport::DEFAULT_CAPACITY - 1).times { subject.land(Plane.new) }
      expect(subject.full?).to be_falsey
    end
  end

  describe 'stormy?' do
    it { should respond_to(:stormy?) }
  end

  describe '#land' do
    it { expect(subject).to respond_to(:land).with(1).argument }
    it 'stores plane on landing in landed planes' do
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    it 'prevents landing when airport is full' do
      allow(subject).to receive(:full?) { true }
      expect { subject.land(plane) }.to raise_error 'Cannot land, airport is full.'
    end

    it 'prevents landing when stormy' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(plane) }.to raise_error 'Cannot land, too stormy.'
    end

    it 'changes planes landed status' do
      subject.land(plane)
      expect(plane.landed?).to eq true
    end

    it 'prevents landing when plane has already landed' do
      allow(plane).to receive(:landed?) { true }
      expect { subject.land(plane) }.to raise_error 'Plane has already landed.'
    end
  end

  describe '#take_off' do
    it { expect(subject).to respond_to(:take_off).with(1).argument }

    it 'removes plane from landed planes' do
      subject.land(plane)
      allow(plane).to receive(:landed?) { true }
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

    it 'raises error when plane takes off that has not landed' do
      expect { subject.take_off(plane) }.to raise_error 'This plane cannot take off as it has not landed'
    end

    it 'prevents take off when it is stormy' do
      allow(subject).to receive(:stormy?) { true }
      allow(plane).to receive(:landed?) { true }
      expect { subject.take_off(plane) }.to raise_error 'Cannot take off, too stormy.'
    end

    it 'changes planes landed status to false' do
      plane.landed = true
      subject.take_off(plane)
      expect(plane.landed?).to eq false
    end
  end

  describe '#confirm_takeoff' do
    it { expect(subject).to respond_to(:confirm_takeoff).with(1).argument }
    it 'returns true when plane has taken off' do
      subject.land(plane)
      allow(plane).to receive(:landed?) { true }
      subject.take_off(plane)
      expect(subject.confirm_takeoff(plane)).to eq true
    end
    it 'returns false when plane has not departed' do
      subject.land(plane)
      expect(subject.confirm_takeoff(plane)).to be_falsey
    end
  end

end
