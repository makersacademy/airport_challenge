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
      airport.take_off(subject)
      expect(subject.at_airport?).to eq false
    end
  end

end
