require "airport"
require "plane"

describe Airport do
    subject(:airport) { described_class.new }
    let(:plane) { double(:plane) }
    let(:plane_grounded) { double(:plane, "A", :flying? => false) }
    let(:plane_flying) { double(:plane, "B", :flying? => true) }
    
    describe "tests:" do
        
        it "can land an airbourne plane" do
            allow(plane_flying).to receive(:land)
            expect(airport.land(plane_flying).view_planes).to include(plane_flying)
        end
        
        it "can make the plane status grounded once landed" do
            expect(plane_flying).to receive(:set_grounded)
        end

        
        it "must only contain planes that have landed" do
            expect{airport.add_plane(plane_flying)}.to raise_error("Airbourne plane needs to land first")
            expect(airport.add_plane(plane_grounded).view_planes).to include(plane_grounded)
        end
        
        
        it "can take off landed planes" do
            allow(plane_grounded).to receive(:take_off)
        end    
            
        context "when full" do
            it "cannot accept any more planes" do
                4.times {airport.add_plane(plane)}
                expect{airport.land(plane_flying)}.to raise_error("Cannot land, airport is full")
            end
        end
        
        
        context "when grounded" do
            it "cannot land" do
                plane_grounded.land(airport)
                expect{plane_grounded.land(airport)}.to raise_error("Plane is already grounded")
            end
            it "can take off from an airport" do
                expect(plane_grounded).to respond_to(:take_off)
            end
            it "can only take off from an airport the plane is in"
                airport2 = Airport.new
                expect{plane_grounded.take_off(airport2)}.to raise_error()
            it "can deregister planes that have taken off" do
                plane_grounded.take_off(airport)
                expect(airport.empty?).to eq(true)
                expect(plane_grounded.flying?).to eq(true)
            end
        end
        
    
    
    end



end
