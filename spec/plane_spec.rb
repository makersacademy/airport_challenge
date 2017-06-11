

require_relative "../lib/plane.rb"

describe Plane do

  subject(:plane) { described_class.new }

   describe "initialize" do

     context "when creating a plane" do

       it "makes plane grounded to start" do
         expect(plane.flying?).to be false
       end

     end

   end

   describe "#flying?" do

     it "checks a planes in-flight status" do
       allow(plane).to receive(:in_flight)
       expect(plane).to receive(:in_flight)
       plane.flying?
     end

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

 # I suspect these tests are redundant.

  describe "#fly" do

    before do
      plane.fly
    end

    it "puts the plane in flight" do
      expect(plane.flying?).to be true
    end
  end

  describe "#land" do

    before do
        plane.land
    end

    it "puts the plane on the ground" do
      expect(plane.flying?).to be false
    end
  end


end
