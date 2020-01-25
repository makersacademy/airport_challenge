require 'airport'

describe Airport do
    let (:plane) {Plane.new}

    describe '#land' do
        it 'lands a plane in the airport' do
            expect(subject.land(plane)).to eq :grounded
        end

        it 'raises an error if an airport is full' do
            10.times { subject.land(Plane.new) }
            expect { subject.land(plane) }.to raise_error "Airport full: cannot land"
        end
    end

end