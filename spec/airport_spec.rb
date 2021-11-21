require 'airport'

describe Airport do
    
    context 'land a plane' do
        it 'checks if there is a land method' do
            airport = Airport.new
            expect(airport).to respond_to :land
        end

        it 'prevents landing when airport full' do
            airport = Airport.new
            plane = Plane.new
            airport.planes << plane
            expect { airport.land(plane) }.to raise_error("Airport full")
        end
    end

    context 'take a plane off' do
        it 'checks if there is a take-off method' do
            airport = Airport.new
            expect(airport).to respond_to :takeoff
        end

        it 'confirms plane no longer in the airport' do
            airport = Airport.new
            plane = Plane.new
            airport.planes << plane
            airport.takeoff(plane)
            expect(airport.planes).not_to include(plane)
        end
    end
end
