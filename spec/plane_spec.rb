require "plane"

describe Plane do

    before(:each) do
        @plane = Plane.new
        @airport = Airport.new
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
        airport = @plane.location
        expect(@plane.take_off(airport)).to be true
    end

    it "does not take off from an airport it's not in" do 
        expect { @plane.take_off(@airport) }.to raise_error 'The plane is not in this airport'
    end
    
    it "cannot be in an airport if it is flying" do
        @plane.take_off(@plane.location) 
        expect(@plane.location).to eq 'in air'
    end

    it "cannot take off if it is flying" do
        airport = @plane.location
        @plane.take_off(airport) 
        expect { @plane.take_off(airport) }.to raise_error 'The plane cannot take off while flying'
    end
    # planes that are already flying cannot take off and/or be in an airport; 
    # planes that are landed cannot land again and must be in an airport, etc.

end