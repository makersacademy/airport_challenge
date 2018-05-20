require "airport"

describe Airport do

  let(:plane) { double :plane }
  let(:plane_a) { double :plane }
  let(:plane_b) { double :plane }
  let(:plane_c) { double :plane }
  let(:airport) { described_class.new }
  let(:another_airport) { described_class.new(25) }
  let(:capacity) { described_class::DEFAULT_CAPACITY }

  context "landing and taking off" do
    it "#land - should make airport incorporate plane" do
      expect(airport.land(plane)).
        to be true
    end

    it "#land - should fail when airport is full" do
      100.times { airport.land(plane) }
      expect(airport.land(plane)).
        to be false
    end

    it "#take_off - should remove plane from airport" do
      airport.land(plane)
      expect(airport.take_off(plane)).
        to be true
    end

    it "#take_off - should fail when plane wasn't at airport to begin with" do
      expect(airport.take_off(plane)).
        to be false
    end

    it "the same plane should take off" do
      airport.land(plane_a)
      airport.land(plane_b)
      airport.land(plane_c)
      airport.take_off(plane_b)
      expect(airport.planes).not_to include plane_b
    end
  end

  context "other features" do
    it "should have a default capacity" do
      capacity.times { airport.land(plane) }
      expect(airport.land(plane)).
        to be false
    end

    it "'s capacity should be settable" do
      25.times { another_airport.land(plane) }
      expect(another_airport.land(plane)).
        to be false
    end

    it "#plane_status(plane) - a plane that has left should register as gone" do
      airport.land(plane_a)
      airport.land(plane_b)
      airport.land(plane_c)
      airport.take_off(plane_b)
      expect(
        airport.plane_status(plane_b)
      ).to eq "plane not at airport"
    end

    it "#plane_status(plane) - a plane that is at the airport should register als still there" do
      airport.land(plane_a)
      expect(
        airport.plane_status(plane_a)
      ).to eq "plane still at airport"
    end
  end

end
