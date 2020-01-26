require 'airport'

describe Airport do
    let (:plane) {Plane.new}

    describe '#new' do
        it 'has a default capacity of 10' do
            airport = Airport.new
            expect(subject.capacity).to eq 10
        end

        it 'can be created with a different capacity' do
            airport = Airport.new(20)
            expect(airport.capacity).to eq 20
        end
    end

    describe '#land' do
        it 'lets a plane land' do
            expect(subject.land(plane)).to eq :grounded
        end

        it 'raises an error if airport is full' do
            10.times { subject.land(Plane.new) }
            expect { subject.land(plane) }.to raise_error "Airport full: cannot land"
        end

        it 'plane must be in airport when landed' do
            subject.land(plane)
            expect(subject.planes).to include plane
        end

    end

    describe '#take_off' do
        before do
            subject.land(plane)
            allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
        end

        it 'lets a plane take off' do
            expect(subject.take_off(plane)).to eq :airborne
        end

        it 'removes a plane from the airport' do
            subject.take_off(plane)
            expect(subject.planes).not_to include plane
        end

        it 'cannot take off it is not in the airport' do
            subject.take_off(plane)
            expect { subject.take_off(plane) }.to raise_error "Plane not in airport"
        end
    end

    context 'when stormy' do
        before do
            subject.land(plane)
            allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
        end
        it 'plane cannot take off' do
            expect { subject.take_off(plane) }.to raise_error "Too stormy for take-off"
        end
    end
    
end