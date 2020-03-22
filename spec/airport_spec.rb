require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  #let(:plane) {Plane.new}

  describe "#plane_landing" do
    it "airport responds to plane_landing" do
      expect(airport).to respond_to :plane_landing
    end
    #it "plane lands at airport" do
       #expect(airport.plane_landing).to be_an_instance_of(Plane)
    #end
    it "responds with 1 argument" do
      expect(airport).to respond_to(:plane_landing).with(1).argument
    end
  end


end
