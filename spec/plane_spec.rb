describe Plane do

  subject(:plane) { described_class.new } 

  context "when flying" do

    describe "#take_off" do
      it "raises an error if in the air" do
        allow(plane).to receive(:flying?).and_return(true)
        expect { plane.take_off }.to raise_error "Plane is already in the air."
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

    describe "#take_off" do
      it "begins to fly after take off" do
        plane.land
        plane.take_off
        expect(plane.flying?).to be true
      end
    end

    describe "#land" do
      it "raises an error if on land" do
        allow(plane).to receive(:flying?).and_return(false)
        expect { plane.land }.to raise_error "Plane is already on the tarmac"
      end
    end

  end

end
