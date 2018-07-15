require 'airport'
require 'plane'

describe Airport do
    subject(:airport) {described_class.new}
    let(:plane) { double :plane }

    describe '#initialize' do
        it 'is expected to have a default capacity' do
            allow(airport).to receive(:stormy?) { false }
            Airport::DEFAULT_CAPACITY.times {airport.land(plane)}
            expect(airport.planes.length).to eq Airport::DEFAULT_CAPACITY
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
                    Airport::DEFAULT_CAPACITY.times {airport.land(plane)}
                    expect { airport.land(plane) }.to raise_error 'Cannot land: Airport is full'
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
        before do
            allow(airport).to receive(:stormy?) { false }
        end
        context 'when not stormy' do
            it 'is expected to respond to the method "take_off" and return a success message' do
                expect {airport.take_off(plane)}.to output("Take-off: Successful\n").to_stdout
            end
            it 'removes the plane from the airport' do
                2.times do
                    airport.land(plane)
                    airport.take_off(plane)
                end
                expect(airport.planes.length).to eq 0
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