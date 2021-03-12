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
            allow(subject).to receive(:stormy_weather) { false }
            airport.land(plane)
            expect(airport.planes_at_airport).to include(plane)
        end

        it 'is expected to raise an error when the airport is full' do
            allow(subject).to receive(:stormy_weather) { false }
            subject.capacity.times { subject.land(plane) }
            expect { subject.land(plane) }.to raise_error 'Airport full'
        end

        it 'prevents take-off if the weather is stormy' do
            allow(subject).to receive(:stormy_weather) { true }
            expect { subject.take_off(plane) }.to raise_error 'The weather is too stormy'
        end
    end

    describe '#take_off' do

        it 'is expected to take off planes' do
            allow(airport).to receive(:stormy_weather) { false }
            airport.land(plane)
            airport.take_off(plane)
            expect(airport.planes_at_airport).to_not include(plane)
        end

        it 'is expected to confirm when a plane has taken off' do
            allow(airport).to receive(:stormy_weather) { false }
            airport.land(plane)
            airport.take_off(plane)
            expect(airport.take_off(plane)).to eq("Plane #{plane} has taken off.")
        end

        it 'prevents take-off if the weather is stormy' do
            allow(subject).to receive(:stormy_weather) { true }
            expect { subject.take_off(plane) }.to raise_error 'The weather is too stormy'
        end

        # it 'only allows planes to take off if they are in the airport' do
        #     allow(airport).to receive(:stormy_weather) { false }
        #     expect(plane).to satisfy("be in airport") do |plane| airport.planes.include?(plane) end
        # end
    end

    it { is_expected.to respond_to :stormy_weather }

end




