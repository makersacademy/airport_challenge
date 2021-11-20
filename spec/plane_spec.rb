require "plane"
require "airport"

describe Plane do
    subject(:plane_grounded) { described_class.new }
    subject(:plane_flying) { described_class.new(true) }
    let(:airport) { double(:airport) }
    
    describe "tests:" do
        # before do 
        #     allow(airport).to receive(:take_off) { true }
        #     allow(airport).to receive(:land)
        #     allow(airport).to receive(:add_plane)
        # end
        
        
        # context "when airbourne" do
        #     it "cannot be in an airport without landing first"
        #         plane_flying.land(airport)
        #         expect(airport.view_planes).to eq(plane_flying)
        #         expect{airport.add_plane(plane_flying)}.to raise_error("Airbourne plane needs to land first")
        #     end
        # end
        
        # context "when grounded" do
        #     it "cannot land" do
        #         plane_grounded.land(airport)
        #         expect{plane_grounded.land(airport)}.to raise_error("Plane is already grounded")
        #     end
        #     it "can take off from an airport" do
        #         expect(plane_grounded).to respond_to(:take_off)
        #     end
        #     it "can only take off from an airport the plane is in"
        #         airport2 = Airport.new
        #         expect{plane_grounded.take_off(airport2)}.to raise_error()
        #     it "can deregister planes that have taken off" do
        #         plane_grounded.take_off(airport)
        #         expect(airport.empty?).to eq(true)
        #         expect(plane_grounded.flying?).to eq(true)
        #     end
        # end
    
    
    end



end

    