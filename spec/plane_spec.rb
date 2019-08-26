require "plane.rb"

describe Plane do
  subject { Plane.new }
  let (:airport) { double :airport }

  describe "#Plane status" do

    it "Plane returns a state" do
      expect(subject).to respond_to(:state)
    end
    it "Is by default flying" do
      expect(subject.state).to eq("flying")
    end

  end

  describe "#Plane land" do
    it "responds to landing and landing location" do
      expect(subject).to respond_to(:land)
    end

    it "raises error when landed plane is told to land" do
      subject.land
      expect { subject.land }.to raise_error "Plane already landed"
    end

    it "flying plane is landed after landing" do
      subject.land
      expect(subject.state).to eq("landed")
    end

  end

  describe "#Plane takeoff" do
    it "reponds to takeoff and takeoff location" do
      expect(subject).to respond_to(:takeoff)
    end

    it "raises error when flying plane it told to take off" do
      expect { subject.takeoff }.to raise_error "Plane has already taken off"
    end

    it "landed plane is flying after take-off" do
      subject.land
      subject.takeoff
      expect(subject.state).to eq("flying")
    end

  end

end
