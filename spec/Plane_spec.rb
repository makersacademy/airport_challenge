require "./lib/plane.rb"

describe Plane do
  subject(:plane) { described_class.new }

  describe "#landing" do

    it "can be landed" do
      subject.land
      expect(subject.landed).to eq true
      expect(subject.in_flight).to eq false
    end

  end

  describe "#takeoff" do

    it "can take off and be in flight" do
      subject.take_off
      expect(subject.in_flight).to eq true
      expect(subject.landed).to eq false
    end

  end

end
