require "airport"

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { double(:plane) }

  describe "initialize airport" do

    it "allows an airport to exist" do
      expect(Airport.new).to be_an_instance_of(Airport)
    end

    it "allows an airport to take two arguments once it is initiated" do
      expect(Airport).to respond_to(:new).with(2).argument
    end

  end

  describe "land" do

    it "allows landing at an airport" do
      expect(airport).to respond_to(:land)
    end

    it "allows landing to have an argument" do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it "ensures that a landed plane gets stored at airport" do
      allow(airport).to receive(:check_stormy).and_return(false)
      allow(plane).to receive(:flying).and_return(true)
      airport.land(plane)
      expect(airport.planes).to include(plane)
    end

    it "raises error if we order a plane to land at an airport when it's not flying" do
      allow(plane).to receive(:flying).and_return(false)
      expect { airport.land(plane) }.to raise_error("This plane is currently parked.")
    end

    it "doesn't allow for landing if weather is stormy" do
      allow(plane).to receive(:flying).and_return(true)
      allow(airport).to receive(:check_stormy).and_return(true)
      expect { airport.land(plane) }.to raise_error("The weather is too stormy to land, wait for further instructions.!")
    end

    it "doesn't allow for landing if airport is full" do
      allow(plane).to receive(:flying).and_return(true)
      allow(airport).to receive(:check_stormy).and_return(false)
      allow(airport).to receive(:full?).and_return(true)
      expect { airport.land(plane) }.to raise_error("This airport is full.")
    end

  end

  describe "take-off" do

    it "allows for a plane to take-off from airport" do
      expect(airport).to respond_to(:take_off)
    end

    it "allows for take-off to have an argument" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it "expects plane that takes-off to be no longer at airport" do
      allow(plane).to receive(:flying).and_return(true)
      allow(airport).to receive(:check_stormy).and_return(false)
      airport.land(plane)
      allow(airport).to receive(:check_stormy).and_return(false)
      airport.take_off(plane)
      expect(airport.planes).not_to include(plane)
    end

    it "raises error if we order a plane to take-off from airport when it's not there" do
      expect { airport.take_off(plane) }.to raise_error("This plane is not at this airport.")
    end

    it "doesnt' allow for take-off if weather is stormy" do
      allow(plane).to receive(:flying).and_return(true)
      allow(airport).to receive(:check_stormy).and_return(false)
      airport.land(plane)
      allow(airport).to receive(:check_stormy).and_return(true)
      expect { airport.take_off(plane) }.to raise_error("The weather is too stormy to take-off, wait for further instructions.!")
    end

  end

  describe "planes" do

    it "ensures airport planes method shows all the planes that have landed" do
      allow(airport).to receive(:check_stormy).and_return(false)
      allow(plane).to receive(:flying).and_return(true)
      plane2 = double(:plane)
      allow(plane2).to receive(:flying).and_return(true)
      airport.land(plane)
      airport.land(plane2)
      expect(airport.planes).to eq([plane, plane2])
    end

  end

  describe "store" do

    it "doesn't allow an airport to store a plane if it is full" do
      allow(airport).to receive(:full?).and_return(true)
      expect { airport.store(plane) }.to raise_error("This airport is full.")
    end

    it "doesn't allow airport to store a plane if it is already there" do
      allow(airport).to receive(:full?).and_return(false)
      airport.store(plane)
      expect { airport.store(plane) }.to raise_error("This plane is already at this airport.")
    end

  end

end
