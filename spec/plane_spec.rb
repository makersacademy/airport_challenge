require "plane"

describe Plane do
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  it { is_expected.to respond_to(:land) }

  it "plane lands" do
    expect(subject.land).to eq "We are landing"
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  # it { is_expected.to respond_to(:take_off) }

  describe "#take_off" do

    it "plane takes off and it is no longer in the airport" do
      airport = Airport.new
      # let(:airport) { Airport.new }
      expect(subject.take_off).to eq "We are taking off"
    end
  end

end
