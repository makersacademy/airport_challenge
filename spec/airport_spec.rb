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
    context "exists" do
      it { is_expected.to respond_to(:plane)}
    end
    context "after #plane has been landed" do
      it "to return landed plane" do
        plane = Plane.new
        subject.land(plane)
        expect(subject.plane).to eq plane
      end
    end
  end
  describe "take_off method" do
    context "exists" do
      it { is_expected.to respond_to(:take_off)}
    end
    context "can take one argument" do
      it { is_expected.to respond_to(:take_off).with(1).argument }
    end
  end
end