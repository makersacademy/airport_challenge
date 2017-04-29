require 'airport'

describe Airport do

  describe '#initialize' do

    it 'defaults capacity' do
      allow(subject.weather).to receive(:stormy?) { false }
      described_class::DEFAULT_CAPACITY.times do
        subject.land(double(:plane, land: true))
      end
      expect{ subject.land(double(:plane, land: true)) }.
        to raise_error 'Airport capacity is full'
    end

    it 'allows to set a different capacity (40)' do
      airport = described_class.new(40)
      expect(airport.capacity).to eq 40
    end

  end

  describe '#accept' do

    let(:plane) { double :plane, land: true, landed?: true }
    before do
      allow(subject.weather).to receive(:stormy?) { false }
    end
    it 'accepts an plane' do
      expect{ subject.land(plane) }.to_not raise_error
    end

    it 'does not accept a plane if it is already in the airport' do
      subject.land(plane)
      expect{ subject.land(plane) }.
        to raise_error 'This plane has already landed here'
    end

    it 'does not allow the plane to land if the weather is stormy' do
      allow(subject.weather).to receive(:stormy?) { true }
      expect { subject.land(plane) }.
        to raise_error 'Could not land because of stormy weather'
    end

    it 'does not accept any more planes when capacity is full' do
      subject.capacity.times { subject.land(double(:plane, land: true)) }
      expect{ subject.land(double(:plane, land: true)) }.
        to raise_error 'Airport capacity is full'
    end

  end

  describe '#take_off' do

    let(:plane) { double :plane, land: true, landed?: false, take_off: true}
    before do
      allow(subject.weather).to receive(:stormy?) { false }
      subject.land(plane)
    end

    it 'takes off a plane' do
      expect{ subject.take_off(plane) }.to_not raise_error
    end

    it 'does not allow to take off if the plane is not there' do
      subject.take_off(plane)
      expect{ subject.take_off(plane) }.
        to raise_error 'This plane was not found in the airport'
    end

    it 'does not allow the plane to take off if the weather is stormy' do
      allow(subject.weather).to receive(:stormy?) { true }
      expect{ subject.take_off(plane) }.
        to raise_error 'Could not take off because of stormy weather'
    end

  end

  describe '#weather' do

    # Airport.weather keeps track of the weather
    it 'should return the weather class' do
      expect(subject.weather).to be_a(Weather)
    end

  end

end
