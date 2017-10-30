require "plane"

describe Plane do

  let(:airport) { double(:airport) }

  describe "#initialize" do

    it "allows a plane to exist" do
      expect(subject).to be_an_instance_of(Plane)
    end

    it "allows a plane to exist passing one argument, flying status" do
      expect(Plane).to respond_to(:new).with(1).argument
    end

  end

  describe "#flying" do

    it "expects a plane to respond to flying method" do
      expect(subject).to respond_to(:flying)
    end

    it "expects flying method to return false to a newly created plane" do
      expect(subject.flying). to eq false
    end

  end

  describe "#attempt landing" do

    it "expects a plane to respond to attempt_land method at an airport" do
      expect(subject).to respond_to(:attempt_land).with(1).argument
    end

    it "expects flying to become false once landing has occured" do
      allow(airport).to receive(:land).and_return(true)
      plane_flying = Plane.new(true)
      plane_flying.attempt_land(airport)
      expect(plane_flying.flying).to eq false
    end

  end

  describe "#attempt taking-off" do

    it "expects a plane to respond to attempt_take_off method at an airport" do
      expect(subject).to respond_to(:attempt_take_off).with(1).argument
    end

    it "expects flying to become true once taking-off has occured" do
      allow(airport).to receive(:take_off).and_return(true)
      subject.attempt_take_off(airport)
      expect(subject.flying).to eq true
    end

  end

  describe "#move_to" do

    it "expects error if move_to is called on a flying plane" do
      allow(subject).to receive(:flying).and_return(true)
      expect { subject.move_to(airport) }.to raise_error("This plane is flying, it must be landed, not moved.")
    end

  end

end
