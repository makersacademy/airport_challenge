require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {Plane.new}
  #let(:plane) {Plane.new}

  describe "#landing" do
    it "responds with 1 argument to landing" do
      expect(airport).to respond_to(:landing).with(1).argument
    end

    it "airport stores plane that has landed" do
      expect(airport.landing(plane)).to include(plane)
    end
  end

  describe "#take_off" do
    it "responds to take_off " do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
    it "Plane is no longer in airport (@planes)" do
      airport.landing(plane)
      expect(airport.take_off(plane)).not_to include(plane)
    end
    it "outputs message to confirm plane is no longer in airport (@planes)" do
    expect{airport.take_off(plane)}. to output("plane gone\n").to_stdout
  end

end

end
