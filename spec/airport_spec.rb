require 'airport'

RSpec.describe Airport do
  let (:plane) {double :plane}
  describe "#land" do
    it "instructs a plane to land" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "should raise an error when full" do
      subject.capacity.times { subject.land(plane) }
      expect{subject.land(plane)}.to raise_error("Airport full.")
    end
  end

  describe "#take_off" do
    it "instructs a plane to take off" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it "should check the plane is gone" do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end
  end

  describe "capacity" do
    it "has a default capacity" do
      (Airport::DEFUALT_CAPACITY).times { subject.land(plane) }
      expect{ subject.land(plane) }.to raise_error("Airport full.")
    end

    let (:test_airport) {Airport.new(40)}
    it "has a variable capacity" do
      (test_airport.capacity).times { test_airport.land(plane) }
      expect { test_airport.land(plane) }.to raise_error "Airport full."
    end
  end
end