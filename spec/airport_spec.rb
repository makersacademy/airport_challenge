require 'airport'

describe Airport do
    it { is_expected.to respond_to(:land).with(1).arguments }

    it { is_expected.to respond_to(:take_off).with(1).arguments }


    it "raise an error when plane is trying to take off when no plane at airport" do
        airport = Airport.new
        plane = Plane.new
        expect {airport.take_off(plane).to raise_error "There are no planes"}

    end

    it "raise an error when airport is full and trying to land a plane " do
        airport = Airport.new
        plane = Plane.new
        expect {airport.land(plane).to raise_error "The airport is full"}
    end
end

