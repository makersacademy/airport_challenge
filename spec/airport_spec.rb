require 'airport'

describe Airport do
 let(:plane) { double(:plane, land:nil, take_off:nil) }
 before :each do
  allow(subject).to receive(:forecast) { 'sunny' }
end
  describe '#land' do
    it { is_expected.to respond_to :land }

    it 'Should land a plane' do
      2.times { subject.land(plane) }
      expect(subject.airfield.size).to eq 2
    end

    it 'Tells the plane to land' do
      expect(plane).to receive(:land)
      subject.land(plane)
    end

    it 'Stop a plane from landing when there is a storm' do
      allow(subject).to receive(:forecast) { 'stormy' }
      expect { subject.land(plane) }.to raise_error "The weather is too bad"
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
      allow(subject).to receive(:forecast) { 'stormy' }
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

  describe '#forecast' do
    it { is_expected.to respond_to(:forecast) }
    it 'gets the current weather forecast' do
      expect(subject.forecast).to be_a String
    end
  end

  describe '#capacity' do
    it 'returns the current capacity of the airport' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end
end
