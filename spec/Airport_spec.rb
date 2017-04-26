require "Airport"

describe Airport do

  subject(:airport) {described_class.new}
  let (:plane) {double :plane}

  describe "weather module" do

    it "module methods included" do
      expect(airport).to respond_to(:stormy?)
    end
  end

  describe "#clear_landing" do

    it "checks it isn't stormy" do
      allow(airport).to receive(:stormy?).and_return(true)
      expect{airport.clear_landing}.to raise_error("Too stormy to land")
    end

    it "checks airport isn't full" do
      allow(airport).to receive(:full?).and_return(true)
      allow(airport).to receive(:stormy?).and_return(false)
      expect{airport.clear_landing}.to raise_error("Airport full")
    end

  end

  describe "#commence_landing" do

    it "stores plane into planes_in_airport on landing" do
      plane = double(:plane, flying?: false, land_at: nil)
      airport.commence_landing(plane)
      expect(airport.landed_planes).to eq([plane])
    end
  end

  describe "#full?" do

    it "returns true when full" do
      full_airport = []
      Airport::DEFAULT_CAPACITY.times{full_airport << plane}
      allow(airport).to receive(:landed_planes).and_return(full_airport)
      expect(airport).to be_full
    end

    it "returns false when not full" do
      expect(airport).not_to be_full
    end

  end

  describe "#clear_take_off" do

    it "checks it isn't stormy" do
      allow(airport).to receive(:stormy?).and_return(true)
      expect{airport.clear_take_off}.to raise_error("Too stormy to take off")
    end
  end

  describe "#commence_take_off" do

    it "Removes plane from landed_planes list after takeoff" do

      allow(airport).to receive(:clear_take_off).and_return(true)

      4.times do
        plane = double(:plane, flying?: false, take_off: nil)
        airport.store_plane(plane)
      end

      finalPlane = double(:plane, flying?: false, take_off: nil)
      airport.store_plane(finalPlane)

      airport.commence_take_off(finalPlane)
      expect(airport.landed_planes.length).to eq(4)
    end
  end
end
