require 'airport'
require 'plane'

describe Airport do

    context 'when weather is clear' do
    
        it 'should land a plane in hangar' do
            airport = Airport.new
            plane = Plane.new
            expect(airport.land(plane)).to eq(["Plane"])
        end

        it 'should tell plane to take off'

        it 'should confirm a recently airborne plane is no longer at airport'

    end


    context 'when weather is stormy' do

        it 'should not land a plane'

        it 'should not tell a plane to take off'

    end



    context 'when Airport is full' do

        it 'should not land a plane'

    end

    context 'when Airport is empty' do

        it 'should not tell a plane to take off'
        
    end

    context 'when system designing' do

        it 'should have a default capacity'

        it 'should change the default capacity'
        
    end

end