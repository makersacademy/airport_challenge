require 'plane'

describe Plane do

  it { should respond_to(:flying) }

  it "should start off flying" do
    expect(subject.flying).to eq true
  end

  describe "#flying" do

    it "should return false when plane is on the ground" do
      airport = Airport.new
      airport.land(subject)
      expect(subject.flying).to eq false
    end

    it "should return true when plane is in the air" do
      airport = Airport.new
      airport.land(subject)
      airport.take_off
      expect(subject.flying).to eq true
    end

  end

end
