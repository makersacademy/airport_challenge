require 'airport'
require 'plane'

describe Airport do
  describe '#land' do
    let(:plane) {double :plane}
    it {is_expected.to respond_to(:land).with(1).argument}
    it 'allows a plane to land' do
      allow(subject).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:landed?)
      allow(plane).to receive(:landed)
      expect(subject.land(plane)).to eq plane
    end
    it 'raises an error when the airport is full' do
      allow(subject).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:landed?)
      allow(plane).to receive(:landed)
      (Airport::DEFAULT_CAPACITY - Airport::DEFAULT_PLANES).times { subject.land(plane)}
      expect{subject.land(plane)}.to raise_error("The airport is full")
    end
    it 'does not land the plane again if landed' do
      allow(plane).to receive(:landed?).and_return(true)
      expect{subject.land(plane)}.to raise_error("This plane has already landed")
    end
  end

  describe '#take_off' do
    let(:plane) {double :plane}
    it {is_expected.to respond_to(:take_off)}
    it 'allows a plane to take off' do
      allow(subject).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:landed?)
      allow(plane).to receive(:landed)
      allow(plane).to receive(:flying)
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end
    it 'removes a plane from the airport after take off' do
      allow(subject).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:landed?)
      allow(plane).to receive(:landed)
      allow(plane).to receive(:flying)
      subject.land(plane)
      subject.take_off
      expect(subject.planes).not_to include(plane)
    end
    it 'raises an error when there are no planes' do
      allow(subject).to receive(:stormy?).and_return(false)
      (Airport::DEFAULT_PLANES).times {subject.take_off}
      expect{subject.take_off}.to raise_error("There are no planes")
    end
  end

  describe '#initialize' do
    it 'sets a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'allows defauly capacity to be overridden' do
      airport = Airport.new(100)
      expect(airport.capacity).to eq 100
    end
  end

  describe '#weather' do
      let(:plane) {double :plane}
      it {is_expected.to respond_to(:generate_weather)}
      it 'does not allow a plane to take off when stormy' do
        allow(subject).to receive(:stormy?).and_return(false)
        allow(plane).to receive(:landed?).and_return(false)
        allow(plane).to receive(:landed)
        allow(plane).to receive(:flying)
        subject.land(plane)
        allow(subject).to receive(:stormy?).and_return(true)
        expect{subject.take_off}.to raise_error("It is too stormy to fly")
      end
      it 'prevents a plane from landing when stormy' do
        allow(subject).to receive(:stormy?).and_return(true)
        allow(plane).to receive(:landed?).and_return(false)
        allow(plane).to receive(:landed)
        expect{subject.land(plane)}.to raise_error("It is too stormy to land")
      end
  end
end
