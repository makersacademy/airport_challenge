require "airport"

describe Airport do

  let(:plane) { double(:plane) }

  describe "#initialize" do

    it "allows an airport to exist" do
      expect(subject).to be_an_instance_of(Airport)
    end

    it "allows an airport to take two arguments once it is initiated" do
      expect(Airport).to respond_to(:new).with(2).argument
    end

  end

  describe "#land" do

    it "allows landing at an airport" do
      expect(subject).to respond_to(:land)
    end

    it "allows landing to have an argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "raises error if we order a plane to land at an airport when it's not flying" do
      allow(plane).to receive(:flying).and_return(false)
      expect { subject.land(plane) }.to raise_error("This plane is currently parked.")
    end

    before { allow(plane).to receive(:flying).and_return(true) }

    it "doesn't allow for landing if weather is stormy" do
      allow(subject).to receive(:check_stormy).and_return(true)
      expect { subject.land(plane) }.to raise_error("The weather is too stormy to land, wait for further instructions.!")
    end

    before { allow(subject).to receive(:check_stormy).and_return(false) }

    it "doesn't allow for landing if airport is full" do
      allow(subject).to receive(:full?).and_return(true)
      expect { subject.land(plane) }.to raise_error("This airport is full.")
    end

    it "ensures that a landed plane gets stored at airport" do
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

  end

  describe "#take-off" do

    it "allows for a plane to take-off from airport" do
      expect(subject).to respond_to(:take_off)
    end

    it "allows for take-off to have an argument" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it "raises error if we order a plane to take-off from airport when it's not there" do
      expect { subject.take_off(plane) }.to raise_error("This plane is not at this airport.")
    end

    before { allow(subject).to receive(:check_stormy).and_return(false) }
    before { allow(plane).to receive(:flying).and_return(true) }

    it "expects plane that takes-off to be no longer at airport" do
      subject.land(plane)
      allow(subject).to receive(:check_stormy).and_return(false)
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

    it "doesnt' allow for take-off if weather is stormy" do
      allow(plane).to receive(:flying).and_return(true)
      subject.land(plane)
      allow(subject).to receive(:check_stormy).and_return(true)
      expect { subject.take_off(plane) }.to raise_error("The weather is too stormy to take-off, wait for further instructions.!")
    end

  end

  describe "#planes" do

    it "ensures @planes is an array" do
      expect(subject.planes).to be_kind_of(Array)
    end

    it "ensures airport planes method shows all the planes that have landed" do
      allow(subject).to receive(:check_stormy).and_return(false)
      allow(plane).to receive(:flying).and_return(true)
      plane2 = double(:plane)
      allow(plane2).to receive(:flying).and_return(true)
      subject.land(plane)
      subject.land(plane2)
      expect(subject.planes).to eq([plane, plane2])
    end

  end

  describe "#store" do

    it "doesn't allow an airport to store a plane if it is full" do
      allow(subject).to receive(:full?).and_return(true)
      expect { subject.store(plane) }.to raise_error("This airport is full.")
    end

    it "doesn't allow airport to store a plane if it is already there" do
      allow(subject).to receive(:full?).and_return(false)
      subject.store(plane)
      expect { subject.store(plane) }.to raise_error("This plane is already at this airport.")
    end

  end

  describe "#capacity" do

    it "ensures capacity returns the capacity of the airport for default capacity" do
      expect(subject.capacity).to eq(20)
    end

    before { allow(plane).to receive(:flying).and_return(true) }
    before { allow(subject).to receive(:check_stormy).and_return(false) }

    it "ensures 20 planes can land in an empty airport" do
      20.times { subject.land(plane) }
      expect(subject.planes.count).to eq(20)
    end

    it "ensures 21 planes trying to land at an airport will return error" do
      20.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error("This airport is full.")
    end

  end

end
