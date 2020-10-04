require "plane"

describe Plane do

    before(:each) do
        @plane = Plane.new
        @airport = Airport.new
        @home_ap = @plane.location
        @destination_ap = @plane.destination
        allow(@airport).to receive(:rand).and_return(1)
        allow(@home_ap).to receive(:rand).and_return(1)
        allow(@destination_ap).to receive(:rand).and_return(1)
    end

    it "is landed at default" do
        expect(@plane.status).to eq 'landed'
    end

    it "default location is an airport" do
        expect(@plane.location).to be_a Airport
    end

    it "has an airport destination" do
        expect(@plane.destination).to be_a Airport
    end

    it "has between 1 and 100 passengers" do
        expect(@plane.passengers).to be_between(1, 100)
    end

    it "takes off from the airport it's in" do 
        expect(@plane.take_off(@home_ap)).to be true
    end

    it "does not take off from an airport it's not in" do 
        expect { @plane.take_off(@airport) }.to raise_error 'The plane is not in this airport'
    end
    
    it "cannot be in an airport if it is flying" do
        @plane.take_off(@home_ap) 
        expect(@plane.location).to eq 'in air'
    end

    it "cannot take off if it is flying" do
        @plane.take_off(@home_ap) 
        expect { @plane.take_off(@home_ap) }.to raise_error 'The plane cannot take off while flying'
    end

    it "cannot be in an airport if it is flying" do
        @plane.take_off(@home_ap) 
        expect(@plane.location).to eq 'in air'
    end
 
    it "cannot land again, if it is landed" do
        expect { @plane.land_at_destination }.to raise_error 'A landed plane cannot land'
    end

    it "is in an airport if it has landed" do
        @plane.take_off(@home_ap)
        @plane.land_at_destination

        expect(@plane.location).to be_a Airport
    end

    it "lands at its destination" do
        @plane.take_off(@home_ap)
        @plane.land_at_destination

        expect(@plane.location).to eq @destination_ap
    end
end