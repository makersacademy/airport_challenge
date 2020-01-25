require 'Plane'

describe Plane do
    let (:airport) {Airport.new} 
    describe '#land' do
        it 'lands at an airport' do
            expect(subject.land).to eq :grounded
        end
    end

    describe '#take_off' do
        it 'takes off from an airport' do
            expect(subject.take_off).to eq :airborne
        end

        it 'is no longer in the airport' do
            subject.take_off
            expect(subject).not_to be_in_airport
        end
    end

end

