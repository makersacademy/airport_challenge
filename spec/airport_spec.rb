require 'airport.rb'

describe Airport do
    subject(:airport) { described_class.new(15) }
    let(:plane) { double :plane }

    describe '#land' do
        it 'instructs plane to land' do
            allow(airport).to receive(:stormy?).and_return false
            expect(airport).to respond_to(:land).with(1).argument
        end

        it 'cannot land if airport full' do
            allow(airport).to receive(:stormy?).and_return false
            15.times do
                airport.land(plane)
            end
            expect { airport.land(plane) }.to raise_error 'cannot land plane as airport full'
        end

        it 'raises an error if asked to land when stormy' do
            allow(airport).to receive(:stormy?).and_return true
            expect {  airport.land(plane) }.to raise_error 'cannot land plane: its stormy'
        end
    end

    describe '#takeoff' do
        it 'instructs plane to takeoff' do
            allow(airport).to receive(:stormy?).and_return false
            expect(airport).to respond_to(:takeoff).with(1).argument
        end

        it 'raises an error if asked to take off when stormy' do
            allow(airport).to receive(:stormy?).and_return true
            expect { airport.takeoff(plane) }.to raise_error 'cannot land plane: its stormy'
        end
    end

    context 'defaults' do
        subject(:default_airport) { described_class.new }
        it 'has default capacity' do
            allow(default_airport).to receive(:stormy?).and_return false
            described_class::DEFAULT_CAPACITY.times { default_airport.land(plane) }
            expect { default_airport.land(plane) }.to raise_error 'cannot land plane as airport full'
        end
    end
end

