require 'airport'

describe Airport do
    let (:plane) {Plane.new}

    describe '#land' do
        it 'lets a plane land' do
            expect(subject.land(plane)).to eq :grounded
        end

        it 'raises an error if an airport is full' do
            10.times { subject.land(Plane.new) }
            expect { subject.land(plane) }.to raise_error "Airport full: cannot land"
        end

    end

    describe '#take_off' do
        it 'lets a plane take off' do
            expect(subject.take_off(plane)).to eq :airborne
        end

        it 'is no longer in the airport' do
            subject.land(plane)
            subject.take_off(plane)
            expect(subject.planes).not_to include plane
        end
    end
    

end