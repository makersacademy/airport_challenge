require  "airport.rb"
describe Airport do
    
    it 'creates an instance of the class Airport' do
        expect(subject).to be_kind_of(Airport)
    end

    it 'defines a default capacity' do
        airport = Airport.new
        expect(airport.capacity).to eq_to(20)
    end

    it 'creates an airport with capacity' do
        airport = Airport.new(10)
        expect(airport.capacity).to eq_to(10)
    end

    it 'has an isntance variable called landed_planes which is an empty array' do
        airport = Airport.new
        
        expect(airport.landed_planes).to eq_to([])
    end 

    it 'has a method called landed_planes ' do
        airport = Airport.new
        expect(airport).to respond_to(:land_plane)
    end 

    it 'instructs the planes to land at the airport' do
        airport = Airport.new
        plane = Plane.new
        airport.land_plane(plane)
        expect(airport.landed_planes).to eq_to([plane])
    end

    it 'instructs a plane to take off and confirm that it is no longer in the airport' do
        airport = Airport.new
        plane = Plane.new
        airport.land_plane(plane)
        expect(airport.takeoff_plane).to eq_to([])
    end
end 
