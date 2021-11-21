require "airport"
require "plane"
require "weather"

describe Airport do
    subject(:airport) { described_class.new() }
    let(:plane_grounded) { double(:plane, name: "A", :flying? => false) }
    let(:plane_flying) { double(:plane, name: "B", :flying? => true) }
    
    context "tests" do

        before do
            allow(plane_flying).to receive(:take_off)
            allow(plane_flying).to receive(:land)
            allow(plane_grounded).to receive(:take_off) 
            allow(plane_grounded).to receive(:land)
            allow(plane_grounded).to receive(:report_flying)

        end
        
        it "can land an airbourne plane" do
            plane = Plane.new("A",true)
            airport.land(plane)
            expect(airport.view_planes).to include(plane)
        end

        it "cannot land planes that have already landed" do
            expect{airport.land(plane_grounded)}.to raise_error("Plane has already landed")
        end
        
        it "can take off planes that are currently landed" do
            airport.add_plane(plane_grounded)
            airport.take_off(plane_grounded)
            expect(airport.view_planes).to be_empty
        end    
            
        it "can identify landed planes as being grounded" do
            plane = Plane.new("A",true)
            airport.land(plane)
            expect(plane.flying?).to eq(false) #How to write using expect..receive with doubles?
        end

        it "must only contain planes that have landed" do
            expect{airport.add_plane(plane_flying)}.to raise_error("Cannot add flying planes")
            airport.add_plane(plane_grounded)
            expect(airport.view_planes).to include(plane_grounded)
        end
        
        it "can instantiate an airport with custom capacity" do
            n = rand(1..100)
            expect(Airport.new(n).capacity).to eq(n)
        end
        
        context "when stormy" do
            it "cannot take off any planes" do
                allow(airport.weather).to receive(:stormy?).and_return true
                airport.add_plane(plane_grounded)
                expect{airport.take_off(plane_grounded)}.to raise_error("Cannot take off during storm")
            end

            it "cannot land any planes" do
                allow(airport.weather).to receive(:stormy?).and_return true
                expect{airport.land(plane_flying)}.to raise_error("Cannot land during storm")
            end
        end

        


        context "when full" do
            it "cannot accept any more planes" do
                10.times {airport.add_plane(Plane.new)}
                expect{airport.land(Plane.new("D",true))}.to raise_error("Airport full")
            end
        end
        
        


        # describe "when grounded" do
        #     it "cannot land" do
        #         plane_grounded.land(airport)
        #         expect{plane_grounded.land(airport)}.to raise_error("Plane is already grounded")
        #     end
        #     it "can take off from an airport" do
        #         expect(plane_grounded).to respond_to(:take_off)
        #     end
        #     it "can only take off from an airport the plane is in" do
        #         airport2 = Airport.new
        #         expect{plane_grounded.take_off(airport2)}.to raise_error()
        #     end
        #     it "can deregister planes that have taken off" do
        #         plane_grounded.take_off(airport)
        #         expect(airport.empty?).to eq(true)
        #         expect(plane_grounded.flying?).to eq(true)
        #     end
        # end
        
    
    
    end



end
