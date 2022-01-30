describe Plane do

  subject(:plane) { described_class.new } 

  context "when flying" do

    describe "#take_off" do
      it "should not allow to take off if already flying" do
        allow(plane).to receive(:flying?).and_return(true)
        expect { plane.take_off }.to raise_error "Plane is already in the air."
      end
    end

    describe "#land" do
      it "should stop flying when it lands" do
        plane.land
        expect(plane.flying?).to be false
      end
    end

  end

  context "when landed" do

    describe "#take_off" do
      it "should start flying after take off" do
        plane.land
        plane.take_off
        expect(plane.flying?).to be true
      end
    end

    describe "#land" do
      it "should not allow to landing if already not flying" do
        allow(plane).to receive(:flying?).and_return(false)
        expect { plane.land }.to raise_error "Plane is already on the tarmac"
      end
    end

  end

end
