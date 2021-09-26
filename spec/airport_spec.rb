require 'airport'
require 'plane'
require 'weather'

describe Airport do

    context 'when weather is clear' do
    
         it 'should land a plane in hangar' do
            airport = Airport.new
            plane = Plane.new
            expect(airport.land(plane)).to eq(["Plane"])
        end

        it 'should tell plane to take off' do
            airport = Airport.new
            plane = Plane.new
            airport.hangar << "plane ready to take off"
            airport.take_off
            expect(airport.hangar.length).to eq(0)
        end
        
        it 'should confirm a recently airborne plane is no longer at airport' do
            airport = Airport.new
            plane = Plane.new
            airport.hangar.push("plane1", "plane2")
            airport.take_off
            expect(airport.hangar).to_not include('plane2')
        end

    end


    context 'when weather is stormy' do

        it 'should not land a plane' 

        it 'should not tell a plane to take off' 

    end

    context 'when system designing' do

        it 'should have a default capacity' do
            expect(Airport.new.capacity).to eq Airport::DEFAULT_CAPACITY
        end

        it 'should override the default capacity' do
            airport = Airport.new
            airport.capacity = 250
            expect(airport.capacity).to_not eq Airport::DEFAULT_CAPACITY
        end
        
    end


    context 'when Airport is full' do

        it 'should not land a plane' do
            airport = Airport.new
            plane = Plane.new
            airport.capacity = Airport::DEFAULT_CAPACITY

            Airport::DEFAULT_CAPACITY.times { airport.land(plane) }

            expect { airport.land(plane) }.to raise_error 'Airport is full'
        end

    end

end