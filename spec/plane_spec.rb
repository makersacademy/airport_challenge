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
    end

    context 'when grounded' do
        before do 
            airport.land(subject)
        end
        it 'cannot land if grounded' do
            expect { subject.land }.to raise_error "Plane already grounded"
        end

        it 'must be in an airport' do
            expect(airport.planes).to include subject
        end
    end

    context 'when airborne' do
        before do
            subject.take_off
        end
        it 'cannot take off' do
            expect { subject.take_off }.to raise_error "Plane already airborne"
        end

        it 'cannot be in an airport' do
            expect(airport.planes).not_to include subject
        end
    end
end

