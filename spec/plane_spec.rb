require 'plane'

describe Plane do 
    it 'should be a type of plane' do 
        expect(subject).to be_an_instance_of(Plane)    
    end

    it 'should have a random flight number created' do 
        expect(subject.flight_number.length).to eq 8
        expect(subject.flight_number == subject.flight_number[/[a-zA-Z]+/]).to be true
    end
end