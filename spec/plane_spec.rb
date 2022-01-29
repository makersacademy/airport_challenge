describe Plane do

  PLANE_IS_FLYING_ERROR = "Plane is already in the air."
  PLANE_IS_ON_LAND_ERROR = "Plane is already on the tarmac"

  subject(:plane) { described_class.new } 

  context "when flying" do
    
    let(:plane) { double(:plane, :flying? => true) }

    describe "#take_off" do

      it "raises an error" do
        plane.take_off
        expect { plane.take_off }.to raise_error PLANE_IS_FLYING_ERROR
      end
    end

    describe "#land" do
      it "stops flying when it lands" do
        plane.land
        expect(plane.flying?).to be false
      end
    end

  end

  context "when landed" do

    let(:plane) { double(:plane, :flying? => false) }

    describe "#take_off" do
      it "begins to flay after take off" do
        plane.take_off
        expect(plane.flying?).to be true
      end
    end

    describe "#land" do
      it "raises an error if on land" do
        plane.land
        expect { plane.land }.to raise_error PLANE_IS_ON_LAND_ERROR
      end

    end

  end

end
