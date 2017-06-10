

require_relative "../lib/plane.rb"

describe Plane do

  subject(:plane) { described_class.new }

   # Missing test: default value on creation is false.

   describe "#flying?" do

      context "when plane is grounded" do
        before do
         plane.land
        end
        it "returns false" do
           expect(plane.flying?).to be false
        end
      end

      context "when plane is in air" do
        before do
         plane.fly
        end
        it "returns true" do
           expect(plane.flying?).to be true
        end
      end
   end

    describe "#fly" do
      it "puts the plane in flight" do
        plane.fly
        expect(plane.flying?).to be true
      end
    end

    describe "#land" do

      it "puts the plane on the ground" do
        plane.land
        expect(plane.flying?).to be false
      end
    end

end
