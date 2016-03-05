require 'plane'

describe Plane do

  describe "landing sequence: " do

    it "can be instructed to land" do
      expect(subject).to respond_to(:land)
    end

    it "can be verified as landed" do
      subject = Plane.new(flying=true)
      subject.land
      expect(subject.airborne?).to eq false
    end

  end

  describe "takeoff sequence:" do

    it "can be instructed to take off" do
      expect(subject).to respond_to(:takeoff)
    end

    it "can be verified as...taken off?" do
      subject = Plane.new(flying=false)
      subject.takeoff
      expect(subject.airborne?).to eq true
    end

  end

end
