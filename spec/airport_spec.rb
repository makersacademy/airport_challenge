require 'airport'

describe Airport do
    
    context 'land a plane' do
        it 'checks if there is a land method' do
            airport = Airport.new
            expect(airport).to respond_to :land
        end

        it 'confirms landed plane is in airport' do
            airport = Airport.new
            plane = Plane.new
            allow(airport).to receive(:get_weather) { "sunny" }
            airport.land(plane)
            expect(airport.planes).to include plane
        end

        it 'prevents landing when airport full' do
            airport = Airport.new
            plane = Plane.new
            airport.planes << plane
            allow(airport).to receive(:get_weather) { "sunny" }
            
            expect { airport.land(Plane.new) }.to raise_error("Airport full")
        end

        it 'prevents landing when when stormy' do
            airport = Airport.new
            allow(airport).to receive(:get_weather) { "stormy" }
            expect { airport.land(Plane.new) }.to raise_error("Cannot land when stormy")
        end

        it 'prevents landing when plane already landed' do
            airport = Airport.new
            plane = Plane.new
            airport.planes << plane
            allow(airport).to receive(:get_weather) { "sunny" }
            expect { airport.land(plane) }.to raise_error("Plane already landed once")
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
            allow(airport).to receive(:get_weather) { "sunny" }
            airport.takeoff(plane)
            expect(airport.planes).not_to include(plane)
        end

        it 'prevents takeoff when stormy' do
            airport = Airport.new
            plane = Plane.new
            airport.planes << plane
            allow(airport).to receive(:get_weather) { "stormy" }
            expect { airport.takeoff(plane) }.to raise_error("Cannot take-off when stormy")
        end

        it 'prevents take-off when plane already took off' do
            airport = Airport.new
            plane = Plane.new
            allow(airport).to receive(:get_weather) { "sunny" }
            airport.planes << plane
            airport.takeoff(plane)
            expect { airport.takeoff(plane) }.to raise_error "Plane already took off"
        end
    end

    context 'tests unique & default capacity for airport instances' do
        it 'checks default airport capacity' do
            airport = Airport.new
            expect(airport.capacity).to eq 1
        end

        it 'checks if capacity was overridden' do
            airport = Airport.new(5)
            expect(airport.capacity).to eq 5
        end
    end

end
