require 'airport'
require "plane"
require 'weather'

describe Airport do
  let(:plane) {double Plane.new}
  let (:today) {double Weather.new}

  describe "#land" do
    it "should land planes into airport" do
      expect(subject.land(plane, "sunny")).to eq([plane])
    end

    # it "should not land when airport is full" do
    #   subject.full?(true)
    #   expect(subject.land(plane)).to eq "Airport is full"
    # end

    it "should not be able to land when capacity has been reached" do
      airport = Airport.new(2)
      plane2 = Plane.new
      plane3 = Plane.new
      airport.land(plane)
      airport.land(plane2)
      expect(airport.land(plane3)).to eq "capacity has been reached"
    end

    it "should not allow planes to land when weather is stormy" do
      expect(subject.land(plane, "stormy")).to eq "Plane not able to land due to storm"
    end
  end

  describe "#take_off" do
    it "should make planes take off" do
      expect(subject.take_off(plane)).to eq ("#{plane} has taken off")
    end

    it "should take the plane out of the airport" do
      subject.land(plane)
      array = subject.planes.length
      subject.take_off(plane)
      expect(subject.planes).to eq ([])
    end

    it "should not be able to take off in stormy weather" do
      expect(subject.take_off(plane, "stormy")).to eq ("Plane can not take off due to stormy weather")
    end

  end

  describe "#capacity" do
    it "should be able to hold 30 planes" do
      expect(subject.capacity).to eq(30)
    end

    it 'should initialize with an empty array' do
      expect(subject.planes).to be_a Array
    end

    it "should be able to be initialized with user specified capacity" do
      expect(Airport.new(28).capacity).to eq(28)
    end
  end

end
