require 'airport'

describe Plane do
    it {is_expected.to respond_to(:landed?)}
    it {is_expected.to respond_to(:the_airplane_has_landed_or_taken_off)}
    it {is_expected.to respond_to(:is_it_landed)}
    
    describe '#is_it_landed'do
        it 'returns true if landed and false if flying' do
            expect(subject.is_it_landed).to be_falsey
        end
        
        it 'returns false if flying' do
            boeing = Plane.new
            berlin_airport = Airport.new
            berlin_airport.land(boeing)
            expect(boeing.is_it_landed).to be_truthy
        end
    end
    
        
    describe '#landed' do
        it 'should report that it has landed' do
            boeing = Plane.new
            berlin_airport = Airport.new
            berlin_airport.land(boeing)
            expect(boeing.landed?).to eq "Refuling and loading passengers"
        end
        
        it 'should report that it in the air' do
            boeing = Plane.new
            expect(boeing.landed?).to eq "Berlin Air flight 302 reporting from above the clouds"
        end
    end
    
   
end