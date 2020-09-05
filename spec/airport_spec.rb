require 'airport'

describe Airport do
    subject(:airport){Airport.new}

    it { is_expected.to respond_to(:land).with(1).arguments }

    it { is_expected.to respond_to(:take_off).with(0).arguments }




    it "raise an error when plane is trying to take off when no plane at airport" do
        expect {airport.take_off.to raise_error "There are no planes"}

    end

    it "raise an error when airport is full and trying to land a plane " do
        airport.capacity.times do
            airport.land Plane.new
        end
        expect {airport.land(plane).to raise_error "The airport is full"}
    end

    it "Overwrite airport capacity" do
    expect{heathrow = Airport.new(100).to eq airport.capacity == 100}
    end
end

