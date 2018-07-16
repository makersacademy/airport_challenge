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
        expect(subject.take_off(plane)).to eq "#{plane} has taken off"
    end 


end