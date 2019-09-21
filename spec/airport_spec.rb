require 'airport'

describe Airport do

  describe 'initialize' do
    it 'defaults to 100 planes if no capacity is given' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'takes a number as the airport capacity' do
      airport = Airport.new(250)
      expect(airport.capacity).to eq 250
    end
  end

  let(:plane) { double :plane } # instantiates plane

  describe '#land' do

    context 'when skies are clear' do

      weather = Weather.new
      
      it 'lands a plane' do
        allow(subject.weather).to receive(:stormy?).and_return(false)
        allow(plane).to receive(:in_air).and_return(true)
        allow(plane).to receive(:landed)
        expect(subject.land(plane)).to eq [plane]
      end

      it 'raises an error if hangar is full' do
        allow(subject.weather).to receive(:stormy?).and_return(false)
        allow(plane).to receive(:in_air).and_return(true)
        allow(plane).to receive(:landed)
        subject.capacity.times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error("Hangar is full")
      end

    end

    context 'during stormy weather' do
      weather = Weather.new
      
      it 'raises an error it is too stormy to land' do
        allow(subject.weather).to receive(:stormy?).and_return(true)
        expect { subject.land(plane) }.to raise_error("Too stormy to land plane!")
      end
    end

  end

  describe '#takeoff' do
    context 'when skies are clear' do
      weather = Weather.new
      
      it 'removes a plane from the hangar' do
        allow(subject.weather).to receive(:stormy?).and_return(false)
        allow(plane).to receive(:in_air).and_return(true)
        allow(plane).to receive(:landed).and_return(false)
        subject.land(plane)
        allow(plane).to receive(:in_air).and_return(false)
        allow(plane).to receive(:flying).and_return(true)
        expect(subject.takeoff(plane)).to eq plane
      end

      it 'raises error if no planes in hangar to takeoff' do
        allow(subject.weather).to receive(:stormy?).and_return(false)
        expect { subject.takeoff(plane) }.to raise_error("No planes in hangar")
      end
    end

    context 'during stormy weather' do
      it 'raises an error it is too stormy to takeoff' do
        weather = Weather.new
        allow(subject.weather).to receive(:stormy?).and_return(false)
        allow(plane).to receive(:in_air).and_return(true)
        allow(plane).to receive(:landed)
        subject.land(plane)
        allow(subject.weather).to receive(:stormy?).and_return(true)
        expect { subject.takeoff(plane) }.to raise_error("Too stormy to takeoff!")
      end
    end

  end
end
