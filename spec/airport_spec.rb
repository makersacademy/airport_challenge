require 'airport'
require 'plane'

describe Airport do
    let(:airport) { Airport.new }
    let(:plane) { Plane.new }

    it { is_expected.to respond_to :land }

    it { is_expected.to respond_to :planes_at_airport }

    it 'has a default capacity' do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    describe '#land' do
        it 'is expected to land planes' do
            airport.land(plane)
            expect(airport.planes_at_airport).to include(plane)
        end

        it 'is expected to raise an error when the airport is full' do
            subject.capacity.times { subject.land(plane) }
            expect { subject.land(plane) }.to raise_error 'Airport full'
        end
    end

    describe '#take_off' do
        it 'is expected to take off planes' do
            airport.land(plane)
            airport.take_off(plane)
            expect(airport.planes_at_airport).to_not include(plane)
        end

        it 'is expected to confirm when a plane has taken off' do
            airport.land(plane)
            airport.take_off(plane)
            expect(airport.take_off(plane)).to eq("Plane #{plane} has taken off.")
        end
    end
end




