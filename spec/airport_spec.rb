require "Airport"
describe Airport do

    # Check plane responds to land method
    it { is_expected.to respond_to(:land).with(1).argument }

    # Responds to take off method
    it { is_expected.to respond_to(:take_off).with(1).argument }

    # Land plane
    it "Lands a plane" do
        plane = Plane.new
        subject.land(plane)
    
    end

    #Take off
    it "Allows a plane to take off" do
        plane = Plane.new
        subject.land(plane)
        expect(subject.take_off(plane)).to eq plane
    end 

    # No takeoff if stormy
    it "Raises error if take_off called when stormy" do
        if subject.weather == "stormy" 
            expect(subject.take_off(plane)). rasise_error("Unable to take off due to storm")
        end
    end
end