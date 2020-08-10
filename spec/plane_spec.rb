require 'plane'

describe Plane do

  it "plane exists" do
    plane = Plane.new
    expect(plane).to be_an_instance_of(Plane)
  end

  describe "#flying" do
    it { is_expected.to respond_to :flying }

    it "is true when plane has taken off" do
      airport = Airport.new
      airport.land(subject)
      airport.take_off(subject)
      expect(subject.flying).to eq true
    end

    it "is false when plane has landed" do
      airport = Airport.new
      airport.land(subject)
      expect(subject.flying).to eq false
    end
  end

end
