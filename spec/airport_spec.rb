require 'airport'
require 'plane'

describe Airport do
    # Extract variables into let statements - accessible across all classes
    subject(:airport) { described_class.new }
    let(:plane) { double :plane }

  it 'has a default capacity' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

    describe '#land' do
        it 'is a method that lands planes' do
          expect(airport).to respond_to :land
        end

        it 'instructs a plane to land' do
        allow(airport).to receive(:stormy?).and_return false
        expect(airport).to respond_to(:land).with(1).argument
        end
      # Refactored to add context
      context 'when full' do
        it 'raises an error' do
          50.times do
            airport.land(plane)
          end
          expect { airport.land(plane) }.to raise_error 'Not able to land, airport has reached its capcity'
        end
      end
    end
      # Refactored to add context
      context 'when stormy'
        it 'raises an error' do
        # Stub out random stormy? and stub the other tests too
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error 'Too stormy to land the plane!'
      end

    describe '#take_off' do
      it 'is a method that takes off planes' do
        expect(airport).to respond_to :take_off
      end

      it 'instructs a plane to take off' do
        expect(airport).to respond_to(:take_off).with(1).argument
      end
    end

end
