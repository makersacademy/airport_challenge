require 'Plane'

describe Plane do
    let (:airport) {Airport.new} 
    describe '#land' do
        it 'lands at an airport' do
            expect(subject.land).to eq :grounded
        end

        it 'cannot land if grounded' do
            subject.land
            expect { subject.land }.to raise_error "Plane already grounded"
        end
    end

    describe '#take_off' do
        it 'takes off from an airport' do
            expect(subject.take_off).to eq :airborne
        end

        # it 'is no longer in the airport' do
        #     subject.take_off
        #     expect(subject).not_to be_in_airport
        # end

        it 'cannot take off it is airborne' do
            subject.take_off
            expect { subject.take_off }.to raise_error "Plane already airborne"
        end

        it 'cannot be in an airport if flying' do
            subject.take_off
            expect(airport.planes).not_to include subject
        end
    end

end

