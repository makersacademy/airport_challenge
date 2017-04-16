require 'plane'

describe Plane do
  test_airport = :test_airport
  describe "#landing" do
    it "should change the location of the plane to the airport" do
      subject.landing(test_airport)
      expect(subject.location).to eq test_airport
    end
  end
  describe "#taking_off" do
    it "should change the location of the plane to up in the air" do
      subject.taking_off
      expect(subject.location).to eq :up_in_the_air
    end
  end
end
