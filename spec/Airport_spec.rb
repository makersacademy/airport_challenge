require "Airport"

describe Airport do

  let (:plane) {double :plane}

  describe "weather module" do
    it "module methods included" do
    expect(subject).to respond_to(:stormy?)
    #p subject.methods
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
      expect{subject.clear_landing}.to raise_error("Airport full")
    end

    it "makes sure the incoming object is a plane" do

    end
  end

  describe "#commence_landing" do

    # it "cannot be called by anything other than a plane" do
    #   plane = double(:plane, flying?: true )
    #   expect{ subject.commence_landing(plane) }.to raise_error("Only plane can control landing")
    #
    # end
    it "raises 'Failed landing checks' if #clear_landing fails" do
      allow(subject).to receive(:clear_landing).and_return(false)
      expect{subject.commence_landing(plane)}.to raise_error("Failed landing checks")
    end



    it "stores plane into planes_in_airport on landing" do
      plane = double(:plane, flying?: false)
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

end
