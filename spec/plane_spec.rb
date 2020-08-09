require 'plane'

describe Plane do

  it "plane exists" do
    plane = Plane.new
    expect(plane).to be_an_instance_of(Plane)
  end

  describe "#at_airport?" do
    it { is_expected.to respond_to :at_airport? }

    it "is false when plane has taken off" do
      airport = Airport.new
      airport.land(subject)
      airport.take_off
      expect(subject.at_airport?).to eq false
    end
  end

end
