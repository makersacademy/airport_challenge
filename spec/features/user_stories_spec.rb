
describe 'UserStory' do 
    it 'planes land at airport, instruct a plane to land' do 
        airport = Airport.new(10)
        plane = Plane.new
        expect { airport.land(plane) }.not_to raise_error
        end 

    it 'planes take off from airport, instruct a plane to take off' do 
        airport = Airport.new(10)
        plane = Plane.new
        expect { airport.take_off(plane)}.not_to raise_error
    end 

    it 'does not allow planes to land when airport is full' do 
        airport = Airport.new(10)
        plane = Plane.new
        10.times do 
            airport.land(plane)
        end 
        expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport full'
    end 

end 

