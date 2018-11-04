require "airport"
require "weather"

describe Airport do

  let(:airport) {Airport.new}

  describe "#Checks initializations" do

    it "Creates hangar" do
      expect(airport.hangar).to eq []
    end

  end

  describe "#Planes can land" do

    it { is_expected.to respond_to(:land) }

    it "Can land a plane into the airport" do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

    it "Prevents planes from landing due to weather" do
      subject.stormy = true
      expect{ subject.land(plane) }.to raise_error "Storm warning: Unable to land"
    end

  end

  describe "#Planes can take off" do

    it { is_expected.to respond_to(:takeoff) }

    it "Allows planes to take off" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end

    it "Prevents planes from takeing off due to weather" do
      subject.stormy = true
      expect{ subject.takeoff(plane) }.to raise_error "Storm warning: Unable to takeofff"
    end

  end

  describe "#Fail for airport above capacity" do

    it "Will fail when capacity exceeded" do
      Airport::DEFAULT_CAPACITY.times{ subject.land Plane.new }
      expect{ subject.land Plane.new }.to raise_error "There are already max planes in hangar"
    end

  end

end
