require 'airport'

describe Airport do

    let (:plane) { double :plane }

    it 'allow user to set airport capacity' do
        airport = Airport.new(25)
        expect(airport.capacity).to eq 25
    end

    it 'use DEFAULT CAPACITY if none given' do
        airport = Airport.new
        expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    describe '#land' do
        it 'allow plane to land at aiport' do
            allow(subject).to receive(:rand_number).and_return(4)
            expect(subject.land(plane)).to eq [plane]
        end

        it 'prevents planes from landing if airport full' do
            allow(subject).to receive(:rand_number).and_return(5)
            subject.capacity.times { subject.land(Plane.new) }
            expect { subject.land(plane) }.to raise_error "Cannot land because airport is full"
        end

        it 'prevent planes from landing if weather is stormy' do
            allow(subject).to receive(:rand_number).and_return(1)
            expect { subject.land(plane) }.to raise_error "Cannot land plane due to stormy weather"
        end

        it 'plane cannot land if already landed' do
            allow(subject).to receive(:rand_number).and_return(5)
            subject.land(plane)
            expect {subject.land(plane) }.to raise_error "I'm already landed"
        end
    end

    describe '#take_off' do
        it 'allow plane to take-off' do
            allow(subject).to receive(:rand_number).and_return(3)
            subject.land(plane)
            expect(subject.take_off(plane)).to eq plane
        end

        it 'prevent plane from taking off if weather is stormy' do
            allow(subject).to receive(:rand_number).and_return(1)
            expect { subject.take_off(plane) }.to raise_error "Cannot take off due to stormy weather"
        end

        it 'plane can only take off if on ground' do
            allow(subject).to receive(:rand_number).and_return(2)
            subject.land(plane)
            subject.take_off(plane)
            expect { subject.take_off(plane) }.to raise_error "I'm already flying"
        end

        it 'plane can only take off if at airport' do
            allow(subject).to receive(:rand_number).and_return(2)
            expect { subject.take_off(plane) }.to raise_error "I'm already flying"
        end
    end
end