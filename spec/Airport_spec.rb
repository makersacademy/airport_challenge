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
      expect{subject.clear_landing}. to raise_error("Too stormy to fly")

    end

    it "checks airport isn't full"

    it "makes sure the incoming object is a plane" do

    end

    it "cannot be called by anything other than a plane" do
      plane = double(:plane, flying?: true )
      expect{ subject.land(plane) }.to raise_error("Only plane can control landing")

    end

    it "stores plane into planes_in_airport on landing" do
      plane = double(:plane, flying?: false)
      subject.land(plane)
      expect(subject.landed_planes).to eq([plane])
    end

  end

  describe "#clear_take_off" do

  end

end
