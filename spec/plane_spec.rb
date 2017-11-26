require "plane"

describe Plane do
  subject(:plane) {described_class.new}

  context "When a plane is created it is not flying" do
      it "is not flying" do
        expect(subject.flying).to eq false
      end
  end

  context "Changing flying attributes when landing/taking off" do
      it "when docking, its flying attribute changes to false" do
        plane.flying = true
        plane.landing
        expect(plane.flying).to eq false
      end


      it "when launching, its flying attribute changes to true" do
        plane.flying
        plane.taking_off
        expect(plane.flying).to eq true
      end
    end

    context "Plane in flight cannot be launched / Plane docked cannot be docked" do
      it "when a plane is flying, it cannot be launched" do
        plane.taking_off
        expect{plane.taking_off}.to raise_error "Plane is already in the air"
      end

      it "when a plane is docked, it cannot be docked again" do
        expect{plane.landing}.to raise_error "Plane is already docked"
      end
    end

end
