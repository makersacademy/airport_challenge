require "airport"

describe Airport do

  before :each do
    @plane = double(:plane)
    @weather = double(:weather, :stormy? => false)
    @airport = Airport.new(@weather)
  end

  context "land plane" do

    describe "#land" do
      it "instructs the plane to land" do
        # expects plane to have its land method called
        expect(@plane).to receive(:land)
        # call the airport.land(@plane) to call plane.land
        @airport.land @plane
      end
    end

    describe "#land" do
      it "has the plane after it has landed" do
        allow(@plane).to receive(:land)
        @airport.land @plane
        expect(@airport.planes).to include @plane
      end
    end

  end

  context "takeoff" do

    describe "#take_off" do
      it "instruct plane to takeoff" do
        expect(@plane).to receive(:take_off)
        @airport.take_off(@plane)
      end
    end

    describe "#take_off" do
      it "doesn't have the plane after takeoff" do
        allow(@plane).to receive(:take_off)
        @airport.planes << @plane
        @airport.take_off(@plane)
        expect(@airport.planes).not_to include @plane
      end
    end

    it "doesn't allow takeoff if weather is stormy" do
      allow(@plane).to receive(:take_off)
      allow(@weather).to receive(:stormy?).and_return true
      expect{@airport.take_off(@plane)}.to raise_error "Cannot takeoff due to stormy weather"
    end

  end

  describe "#stormy?" do
    it "checks if weather is stormy" do
      allow(@weather).to receive(:stormy?).and_return true
      expect(@airport.stormy?).to eq true
    end
  end

end
