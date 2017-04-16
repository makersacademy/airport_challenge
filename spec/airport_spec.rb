
require 'airport'

describe Airport do 

let(:plane) {double(:plane, landed?: false, flying?: true, land: nil, take_off: nil)}
let(:weatherforecast) { double :weatherforecast}
  
  subject(:airport) { described_class.new( weatherforecast ) }

  describe '#land' do

    context 'when not stormy' do
      before do 
        allow(weatherforecast).to receive(:stormy?).and_return false
      end
      it 'allows a flying plane to land' do
        expect(airport.land(plane)).to eq "The plane has now landed"
      end
      it 'houses the plane at the airport after landing' do
        airport.land(plane)
        expect(airport.in_airport?(plane)).to eq true    
      end
      it 'will raise an error if a plane has already landed' do
        allow(plane).to receive(:landed?).and_return true
        expect{airport.land(plane)}.to raise_error("This plane has already landed")  
      end

      context 'when full' do
        it 'raises an error' do
          allow(weatherforecast).to receive(:stormy?).and_return false
          Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
          expect{subject.land(plane)}.to raise_error("The airport is full!")
        end 
      end
    end

    context 'when stormy' do
      it 'raises an error'do
        allow(weatherforecast).to receive(:stormy?).and_return true
        expect{ airport.land(plane) }.to raise_error("Too stormy to land!")
      end
    end
  end

  describe '#take_off' do
    context ' when not stormy' do
      before do 
        allow(weatherforecast).to receive(:stormy?).and_return false
      end
        it 'allows a plane to take off from the airport' do
          airport.land(plane)
          expect(airport.take_off(plane)).to eq "The plane has taken off"
        end
        it 'won\'t allow a plane to take off if the airport is empty' do
          expect{ airport.take_off(plane) }.to raise_error("There are no planes available for take off")
        end
        it 'no longer has the plane after takeoff' do
          allow(plane).to receive(:flying?).and_return(true)
          expect(airport.in_airport?(plane)).to eq false
        end
    end
    context' when stormy' do
      before do 
        allow(weatherforecast).to receive(:stormy?).and_return true
      end
        it 'raises an error' do
          expect{ airport.take_off(plane) }.to raise_error("Too stormy to take-off!")
        end
      end
  end

  describe '#initialize' do
    it 'initialises with one argument' do
      expect{Airport.new(30)}.not_to raise_error
    end
    it 'initialises with default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end
end
