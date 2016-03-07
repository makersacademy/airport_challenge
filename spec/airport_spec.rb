require 'airport'

describe Airport do
  let(:plane) { double(:plane, land:nil, take_off:nil) }
  before :each do
    allow(subject).to receive(:stormy?) { false }
  end

  describe '#new' do
    it 'allows us to change the capacity of the airfield' do
      airport = Airport.new(20)
      expect(airport.capacity).to eq 20
    end
  end
  describe '#land' do

    it 'Should land a plane' do
      2.times { subject.land(plane) }
      expect(subject.airfield.size).to eq 2
    end

    it 'Tells the plane to land' do
      expect(plane).to receive(:land)
      subject.land(plane)
    end

    it 'Stop a plane from landing when there is a storm' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(plane) }.to raise_error "The weather is too bad"
    end

    it 'fails when airport is full' do
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "The airport is full"
    end
  end

  describe '#confirm_landing' do
    it 'Confirms landing' do
      subject.land(plane)
      expect(subject.confirm_landing(plane)).to eq true
    end
  end

  describe '#dispatch' do
    it { is_expected.to respond_to(:dispatch).with(1).argument }

    it 'Dispaches the plane' do
      subject.land(plane)
      subject.dispatch(plane)
      expect(subject.airfield.size).to eq 0
    end

    it 'Tells the plane to take off' do
      subject.land(plane)
      expect(plane).to receive(:take_off)
      subject.dispatch(plane)
    end

    it 'Stop a plane from taking off when there is a storm' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(plane) }.to raise_error "The weather is too bad"
    end
  end

  describe '#confirm_dispatch' do
    it 'Confirms dispatch' do
      subject.land(plane)
      subject.dispatch(plane)
      expect(subject.confirm_dispatch(plane)).to eq true
    end
  end

  describe '#stormy?' do

    it 'tells you weather it\'s sunny or not' do
      airport = Airport.new
      expect(airport.stormy?).to satisfy do |value|
        [true, false].include? value
      end
    end

  end

  describe '#capacity' do
    it 'returns the current capacity of the airport' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end
end
