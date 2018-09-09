require_relative "../lib/airport"

describe Airport do
    
    # As an air traffic controller 
    # So I can get passengers to a destination 
    # I want to instruct a plane to land at an airport

    it 'expect airport to responds to calling "land_plane' do
        expect(subject).to respond_to(:land_plane)
    end

    it 'expect airport to be able to land a plane at the airport' do
        plane = Plane.new
        expect(subject.land_plane(plane)).to eq([plane])
    end

    # As an air traffic controller 
    # So I can get passengers on the way to their destination 
    # I want to instruct a plane to take off from an airport and 
    # confirm that it is no longer in the airport

    it 'expect airport to responds to calling "take_off' do
        expect(subject).to respond_to(:take_off)
    end

                            # it 'expect "plane" to be able to take off from the airport' do
                            #     plane = Plane.new
                            #     expect(subject.take_off(plane)).to eq(plane)
                            # end

    it 'expect "plane" to be able to take off from the airport confirm that the plane takes off and is no longer in the airport' do
        plane = Plane.new
        subject.land_plane(plane)
        subject.take_off(plane)
        expect(subject.plane_list).to eq([])
    end

    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent takeoff when weather is stormy 

    it 'expect planes to not be able to take off if the weather is "stormy"' do
        ace = Airport.new("stormy")
        plane = Plane.new
        ace.land_plane(plane)
        expect{ace.take_off(plane)}.to raise_error("Weather is too harsh for planes to take off")
    end
    

    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent landing when weather is stormy 

    
    it 'expect planes to not be able to land if the weather is "stormy"' do
        ace = Airport.new("stormy")
        plane = Plane.new
        expect{ace.land_plane(plane)}.to raise_error("Weather is too harsh for planes to land")
    end

end
