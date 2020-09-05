require 'weather'
require 'airport'
require 'plane'


describe Weather do



    describe "check weather" do
        context "check default weather" do
            it "Check default weather is false" do
                weather = Weather.new
                expect {weather.is_stormy?.to eq false}
            end
        end

        context "set weather" do
            it "Check stormy weather is true" do
                weather = Weather.new(true)
                expect {weather.is_stormy?.to eq true}
            end
        end
    end




    describe "Not stormy weather" do


        context "Can land" do
            it "If weather is not stormy plane can land at airport" do
                airport = Airport.new #default weather is not stormy
                plane = Plane.new
                expect {airport.land(plane).to raise_error "Stormy weather cannot land"}
                
            end
        end
        context "Can takeoff" do
        end
    end 


    describe "Stormy weather" do
        context "Cannot land" do
            it "If weather is stormy plane cannot land at airport" do
                airport = Airport.new #default weather is not stormy
                airport.set_stormy(true)
                plane = Plane.new
                expect {airport.land(plane).to raise_error "Stormy weather cannot land"}   
            end
        end
        context "Cannot takeoff" do
        end
    end    
end