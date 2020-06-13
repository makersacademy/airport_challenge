require('airport')

describe 'Airport' do

    describe '#initialize' do

        it 'creates a new class of airport' do
            expect(Airport.new).to be_an_instance_of(Airport)
        end

        it 'expects there to be an empty array for planes as a default' do
            airport = Airport.new
            expect(airport.planes).to eq([])
        end

        it 'expects the default capacity to be an integer' do
            airport = Airport.new
            expect(airport.capacity.class).to eq(Integer)
        end
    
        it 'allows default capacity to change subsequently' do
            airport = Airport.new
            airport.capacity = 5
            expect(airport.capacity).to eq(5)
        end

    end 

    describe '#landing' do

        it 'allows a plane to land at an airport' do
            airport = Airport.new
            plane = Plane.new
            airport.safe_to_fly = true
            expect(airport.land(plane)).to eq("The plane has landed")
        end

        it 'expects a landing to be prevented if airport is full' do
            airport = Airport.new
            plane1 = Plane.new
            plane2 = Plane.new
            airport.safe_to_fly = true
            airport.land(plane1)
            expect(airport.land(plane2)).to eq("The airport is full")
        end

        it 'expects a landing to be cancelled if the weather is bad' do
            airport = Airport.new
            plane1 = Plane.new
            airport.safe_to_fly = false
            expect(airport.land(plane1)).to eq("It's not safe to land")
        end

    end

    describe '#takeoff' do

        it 'allows a plane to take off' do
            airport = Airport.new
            plane = Plane.new
            airport.safe_to_fly = true
            airport.land(plane)
            airport.safe_to_fly = true
            airport.takeoff(plane)
            expect(airport.takeoff(plane)).to eq("The plane has taken off")
        end

        it 'expects a takeoff to be cancelled if the weather is bad' do
            airport = Airport.new
            plane1 = Plane.new
            airport.safe_to_fly = true
            airport.land(plane1)
            airport.safe_to_fly = false
            expect(airport.takeoff(plane1)).to eq("It's not safe to take off")
        end

        it 'expects a takeoff to be cancelled if there are no planes' do
            airport = Airport.new
            plane1 = Plane.new
            airport.safe_to_fly = true
            expect(airport.takeoff(plane1)).to eq("There are no planes")
        end

    end
    

    

    


end