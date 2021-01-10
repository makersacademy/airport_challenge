require 'airport'

describe Airport do
    it { is_expected.to respond_to(:land, :take_off) }

    describe 'initialization' do

        subject { Airport.new }
        let(:plane) { Plane.new }
        it 'defaults capacity' do
            allow(subject).to receive(:stormy?).and_return false
            described_class::DEFAULT_CAPACITY.times do
                subject.land(Plane.new)
            end
            expect { subject.land(Plane.new) }.to raise_error 'Airport is full'
        end

        it 'has a variable capacity' do
            airport = Airport.new(30)
            allow(airport).to receive(:stormy?).and_return false
            airport.capacity.times { airport.land Plane.new }
            expect { airport.land Plane.new }.to raise_error 'Airport is full'
        end
    end

    describe '#land' do

        it 'allows a plane to land at the airport' do
            allow(subject).to receive(:stormy?).and_return false
            plane = Plane.new
            subject.land(plane)
            expect(subject.planes[subject.planes.count - 1]).to eq plane
        end

        it 'raises an error when the airport is full' do
            allow(subject).to receive(:stormy?).and_return false
            20.times { subject.land(Plane.new) }
            expect { subject.land(Plane.new) }.to raise_error 'Airport is full'
        end

        it 'raises an error when weather conditions are stormy' do
            allow(subject).to receive(:stormy?).and_return true
            expect { subject.land(Plane.new) }.to raise_error 'Weather conditions too stormy for landing'
        end

        it 'raises an error when plane is already at the airport' do
            allow(subject).to receive(:stormy?).and_return false
            plane = Plane.new
            subject.land(plane)
            expect { subject.land(plane) }.to raise_error 'Plane already at airport'
        end

    end

    describe '#take_off' do

        it 'raises an error if there are no planes available to take off' do
            expect { subject.take_off }.to raise_error 'No planes available'
        end

        it 'confirms plane is no longer in airport after take off' do
            allow(subject).to receive(:stormy?).and_return false
            subject.land(Plane.new)
            plane = subject.take_off
            expect(subject.planes).not_to include(plane)
        end

        it 'raises an error when weather conditions are stormy' do
            # allow(subject).to receive(:stormy?).and_return false
            subject.land(Plane.new)
            allow(subject).to receive(:stormy?).and_return true
            expect { subject.take_off }.to raise_error 'Weather conditions too stormy for take-off'
        end

    end


end