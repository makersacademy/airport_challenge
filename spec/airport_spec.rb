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
        expect(subject.land(plane)).to include(plane)
      end
    end
    context "returns error" do
      it "if plane is already landed and in planes array" do
        plane = Plane.new
        subject.land(plane)
        expect {subject.land(plane)}.to raise_error("Plane has already landed at airport")
      end
    end
    context "Capacity" do
      it 'has a default capacity' do
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end
    end
  end
  describe "planes method" do
    context "exists" do
      it { is_expected.to respond_to(:planes)}
    end
    context "after #plane has been landed" do
      it "to return landed plane" do
        plane = Plane.new
        subject.land(plane)
        expect(subject.planes).to include(plane)
      end
    end
    context "should return" do
      it "an array" do
        expect(subject.planes).to be_a(Array)
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
    context "removes #plane from plane attribute" do
      it "and returns nil" do
        plane = Plane.new
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes).not_to include(plane)
      end
    end
    context "returns error" do
      it "if plane is not in planes array" do
        plane = Plane.new
        expect {subject.take_off(plane)}.to raise_error("Plane not at airport, cannot take off")
      end
    end
  end
end