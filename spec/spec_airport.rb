require 'airport'
require 'plane'

RSpec.describe Plane do
    describe "Check if a plane is flying or grounded" do
        it "Test on flying plane" do
            testplane = subject.initialise("flying")
            expect(subject.is_plane_flying?).to eq("flying") 
        end

        it "Test on grounded plane" do
            testplane = subject.initialise("grounded")
            expect(subject.is_plane_flying?).to eq("grounded") 
        end
    end

    describe "Can a plane land only when it's flying?" do
        it "Test if a flying plane can land" do
            testplane = subject.initialise("flying")
            expect(subject.land.is_plane_flying?).to eq("grounded")
        end
    end
end