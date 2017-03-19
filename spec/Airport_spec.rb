require "Airport"

describe Airport do

  let (:plane) {double :plane}

  describe "weather module" do

    it "module methods included" do
    expect(subject).to respond_to(:stormy?)
    end

  end
  describe "#clear_landing" do

    it "has the method" do
      expect(subject).to respond_to(:clear_landing)

    end

    it "checks it isn't stormy" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect{subject.clear_landing}.to raise_error("Too stormy to land")

    end

    it "checks airport isn't full" do
      allow(subject).to receive(:airport_full?).and_return(true)
      allow(subject).to receive(:stormy?).and_return(false)
      expect{subject.clear_landing}.to raise_error("Airport full")
    end

    it "makes sure the incoming object is a plane" do

    end
  end

  describe "#commence_landing" do

    it "stores plane into planes_in_airport on landing" do
      plane = double(:plane, flying?: false, land_at: nil)
      subject.commence_landing(plane)
      expect(subject.landed_planes).to eq([plane])
    end

  end

  describe "#airport_full?" do

    it "returns true when full" do
      full_airport = []
      Airport::DEFAULT_CAPACITY.times{full_airport << plane}
      allow(subject).to receive(:landed_planes).and_return(full_airport)
      expect(subject.airport_full?).to eq(true)
    end

    it "returns false when not full" do
      expect(subject.airport_full?).to eq(false)
    end

  end

  describe "#clear_take_off" do

    it "checks it isn't stormy" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect{subject.clear_take_off}.to raise_error("Too stormy to take off")
    end

  end

  describe "#commence_take_off" do

    it "Removes plane from landed_planes list after takeoff" do
      allow(subject).to receive(:clear_take_off).and_return(false)
      allow(plane).to receive(:take_off).and_return nil

      planes_in_airport = []
      dummy_plane = double(:dummy_plane)
      5.times {planes_in_airport << dummy_plane}
      planes_in_airport << plane
      allow(subject).to receive(:landed_planes).and_return(planes_in_airport)

      subject.commence_take_off(plane)
      expect(subject.landed_planes.length).to eq(5)

    end

    it "removes the correct plane" do

    end

  end

end
