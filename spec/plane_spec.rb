require 'plane'

describe Plane do
    subject(:plane){Plane.new}

    it { is_expected.to respond_to(:takeoff)}
    it { is_expected.to respond_to(:land)}
    it { is_expected.to respond_to(:flying?)}


    context "flying?" do
        it "Check flying status is false" do
            expect(plane.flying?).to be(false)
        end
        it "Check flying status is true" do
            plane0 = Plane.new(true)
            expect(plane0.flying?).to be(true)
        end
    end




#takeoff
    context "takeoff" do  
        it "Plane can take off" do
            plane1 = Plane.new
            expect{plane1.takeoff}.to_not raise_error
        end

        it "Plane cannot take off" do
            plane2 = Plane.new(true)
            expect{plane2.takeoff}.to raise_error "Plane is already flying" 
        end
    end

     


 #land 
    context "land" do  
        it "Plane can land" do
            plane3 = Plane.new(true)
            expect{plane3.land}.to_not raise_error
        end

        it "Plane cannot land" do
            plane4 = Plane.new
            expect{plane4.land}.to raise_error "Plane is already landed" 
        end
end




end