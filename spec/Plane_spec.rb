require "./lib/plane.rb"

describe Plane do
  subject(:plane) { described_class.new }

  describe "#landing and inconsistancy" do

    it "can be landed" do
      subject.land
      expect(subject.landed).to eq true
      expect(subject.in_flight).to eq false
    end

    it "raises an error if you try to land a plane that is already landed" do
      subject.land
      expect{subject.land}.to raise_error(RuntimeError)
    end

  end

  describe "#takeoff" do

    it "can take off and be in flight" do
      subject.take_off
      expect(subject.in_flight).to eq true
      expect(subject.landed).to eq false
    end

    it "raises an error if you try to takeoff a plane that's already in flight" do
      subject.take_off
      expect{subject.take_off}.to raise_error(RuntimeError)
    end

  end

end
