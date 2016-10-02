require "airport"

describe Airport do

  before :each do
    @plane = double(:plane)
    @weather = double(:weather, :stormy? => false)
    @airport = Airport.new(@weather)
  end

  describe "#take_off" do
    context "given a plane" do
      it "calls #land on the plane" do
        expect(@plane).to receive(:take_off)
        @airport.take_off(@plane)
      end
    end

    context "once instructed a plane to takeoff" do
      it "removes the plane from the array" do
        allow(@plane).to receive(:take_off)
        @airport.planes << @plane
        @airport.take_off(@plane)
        expect(@airport.planes).not_to include @plane
      end
    end

    context "when #stormy? is true" do
      it "raises an error" do
        allow(@plane).to receive(:take_off)
        allow(@weather).to receive(:stormy?).and_return true
        expect{@airport.take_off(@plane)}.to raise_error "Cannot takeoff due to stormy weather"
      end
    end
  end

  describe "#land" do
    context "when given a plane"
      it "instructs the plane to land" do
        # expects plane to have its land method called
        expect(@plane).to receive(:land)
        # call the airport.land(@plane) to call plane.land
        @airport.land @plane
      end
    end

    context "once instructed the plane to land" do
      it "adds the plane to the array" do
        allow(@plane).to receive(:land)
        @airport.land @plane
        expect(@airport.planes).to include @plane
      end
    end
  end

  describe "#stormy?" do
    context "when @weather.stormy? is true" do
      it "returns true" do
        allow(@weather).to receive(:stormy?).and_return true
        expect(@airport.stormy?).to eq true
      end
  end

end
