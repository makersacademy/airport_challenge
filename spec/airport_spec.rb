require "airport.rb"
RSpec.describe Airport do
  describe "land method" do
    context "exists" do
      it { is_expected.to respond_to(:land)}
    end
    context "can take one argument" do
      it { is_expected.to respond_to(:land).with(1).argument }
    end
    context "takes plane as argument" do
      it "and returns plane" do
        plane = Plane.new
        expect(subject.land(plane)).to eq plane
      end
    end
  end
  describe "plane method" do
    it "to return a plane object" do
      expect(subject.plane).to be_a(Plane)
    end
  end
end