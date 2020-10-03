require "plane"

describe Plane do

    before(:each) do
        @plane = Plane.new
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
    # planes can only take off from airports they are in; 
    # planes that are already flying cannot take off and/or be in an airport; 
    # planes that are landed cannot land again and must be in an airport, etc.

end