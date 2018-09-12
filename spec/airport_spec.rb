require_relative "../lib/airport"

describe Airport do
    
    # As an air traffic controller 
    # So I can get passengers to a destination 
    # I want to instruct a plane to land at an airport

    it 'expect airport to responds to calling "land_plane"' do
        expect(subject).to respond_to(:land_plane)
    end

    it 'expect airport to be able to land a plane at the airport' do
        plane = Plane.new
        allow(subject).to receive(:stormy?).and_return(false)
        expect(subject.land_plane(plane)).to eq([plane])
    end

    # As an air traffic controller 
    # So I can get passengers on the way to their destination 
    # I want to instruct a plane to take off from an airport and 
    # confirm that it is no longer in the airport

    it 'expect airport to responds to calling "take_off' do
        expect(subject).to respond_to(:take_off)
    end

    it 'expect "plane" to be able to take off from the airport confirm that the plane takes off and is no longer in the airport' do
        plane = Plane.new
        allow(subject).to receive(:stormy?).and_return(false)
        subject.plane_list.push(plane)
        subject.take_off(plane)
        expect(subject.plane_list).to eq([])
    end

    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent takeoff when weather is stormy? 

    it 'expect planes to not be able to take off if the weather is "stormy?"' do
        plane = Plane.new
        subject.plane_list.push(plane)
        allow(subject).to receive(:stormy?).and_return(true)
        expect{subject.take_off(plane)}.to raise_error("Weather is too harsh for planes to take off")
    end
    

    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent landing when weather is stormy? 
    
    it 'expect planes to not be able to land if the weather is "stormy?"' do
        plane = Plane.new
        allow(subject).to receive(:stormy?).and_return(true)
        expect{subject.land_plane(plane)}.to raise_error("Weather is too harsh for planes to land")
    end

    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent landing when the airport is full 

    it 'expect planes to not be able to land if the Airport is at "max" capacity' do
        plane = Plane.new
        allow(subject).to receive(:stormy?).and_return(false)
        subject.land_plane(plane)
        expect{Airport::DEFAULT_CAPACITY.times{subject.land_plane(Plane.new)}}.to raise_error("Airport capacity at max, can not land plane")
    end

    # As the system designer
    # So that the software can be used for many different airports
    # I would like a default airport capacity that can be overridden as appropriate

    it 'expect default capacity to be set if none is provided' do
        expect(subject.capacity).to eq (Airport::DEFAULT_CAPACITY)
    end

    it 'expect the default capacity of airport to be overridden as appropriate' do
        allow(subject).to receive(:capacity) {50}
        expect(subject.capacity).to eq (50)
    end
end
