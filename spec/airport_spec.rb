require 'airport'
require 'plane'
require 'weather'

describe Airport do
    subject(:airport) {described_class.new}
    let(:plane) { double :plane }
    let(:weather) { double :weather }

    describe '#initialize' do
        it 'is expected to have a default capacity' do
            allow(airport).to receive(:stormy?) { false }
            allow(airport.landed).to receive(:include?) { false }
            Airport::DEFAULT_CAPACITY.times {airport.land(plane)}
            expect(airport.landed.length).to eq Airport::DEFAULT_CAPACITY
        end  
        it 'allows users to override the capacity' do
            expect(Airport.new(5).capacity).to eq 5
        end
    end

    describe '#land' do
        context 'when not stormy' do
            before do
                allow(airport).to receive(:stormy?) { false }
            end
            context 'when full' do
                it 'raises an error' do
                    allow(airport.landed).to receive(:include?) { false }
                    Airport::DEFAULT_CAPACITY.times {airport.land(plane)}
                    expect { airport.land(plane) }.to raise_error 'Cannot land: Airport is full'
                end
            end
            context 'when already landed' do
                it 'raises an error' do
                    allow(airport.landed).to receive(:include?) { true }
                    expect { airport.land(plane) }.to raise_error 'Cannot land: Already landed'
                end
            end
        end

        context 'when stormy' do
            it 'raises an error' do
                allow(airport).to receive(:stormy?) { true }
                expect { airport.land(plane) }.to raise_error 'Cannot land: Weather is stormy' 
            end
        end
    end

    describe '#take_off' do
        context 'when not stormy' do
            before do
                allow(airport).to receive(:stormy?) { false }
            end   
            it 'removes the plane from the airport' do
                airport.land(plane)
                airport.take_off(plane)
                expect(airport.landed.length).to eq 0
            end
            it 'raises an error if plane not at this airport' do
                LHR = described_class.new
                allow(LHR).to receive(:stormy?).and_return false
                LHR.land(plane)
                expect { airport.take_off(plane) }.to raise_error 'Cannot take-off: Not at this airport'
            end
        end
        
        context 'when stormy' do
            it 'raises an error' do
                allow(airport).to receive(:stormy?) { true }
                expect { airport.take_off(plane) }.to raise_error 'Cannot take-off: Weather is stormy'
            end
        end
    end
end