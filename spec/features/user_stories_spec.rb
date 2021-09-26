
describe Airport do
    it 'so planes land at airports, instucts a plane to land' do
        airport = Airport.new(10)
        plane = Plane.new
        expect {airport.land(plane)}.not_to raise_error
    end

    it 'so planes take off from airports, instuct a plane to land' do
        airport = Airport.new(10)
        plane = Plane.new
        expect {airport.take_off(plane)}.not_to raise_error
    end
   
    it 'prevents planes landing when airport is full' do
        airport = Airport.new(10)
        plane = Plane.new
        10.times { airport.land(plane) }
        expect{airport.land(plane)}.to raise_error "The airport is full!"
    end
end

