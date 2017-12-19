require "airport"
require "plane"
require "hand_of_god"

describe Airport do
  # Name the subject explicitly
  subject(:airport) { described_class.new }

  # Define Doubles

  # Test for initializing an airport
  context "Airport initialization can work both with arguments and without" do
    it "accepts a capacity argument, if not capacity defaults to DEFAULT_CAPACITY" do
      expect { Airport.new(30) }.not_to raise_error
      expect { Airport.new }.not_to raise_error
      expect(subject.airp_capacity).to eq Airport::CAPACITY
    end
  end

  # Tests for Airport responding to methods
  context "Airport responds to various methods" do
    it "plane can land" do
      expect(subject).to respond_to :dock
    end

    it "plane can take off" do
      expect(subject).to respond_to :launch
    end

    it "airport logs how many planes are docked" do
      expect(subject).to respond_to :count_of_planes
    end
  end

  # Test for docking and launching a plane and checking
  # how many planes are in the airport at any given time
  context "Airport is docking & launching planes" do
    # Set stormy? to be false for tests of just docking & launching planes
    before (:each) do allow(airport).to receive(:stormy?).and_return(false) end
    it " - a plane lands" do
       # airport = Airport.new  --- Omitted as we have used subject(:airport) {described_class.new}
      plane = Plane.new
      subject.dock(plane)
      expect(subject.count_of_planes).to eq 1
    end

    it " - a plane takes off" do
      # airport = Airport.new  --- Omitted as we have used subject(:airport) {described_class.new}
      plane = Plane.new
      subject.dock(plane)
      subject.launch(plane)
      expect(subject.count_of_planes).to eq 0
    end
  end

    # Tests for preventing a plane launching if weather is stormy
  context "Weather conditions are affecting docking & launching" do

    it "stops a plane from launching if stormy" do
    # We need to temporarily set stormy to false,so we can dock a plane
      allow(airport).to receive(:stormy?).and_return(false)
      plane = Plane.new
      subject.dock(plane)
    # We set stormy to true,so we can run our test
      allow(airport).to receive(:stormy?).and_return(true)
      expect { subject.launch(plane) }.to raise_error "Weather Stormy!! Planes are Grounded"
    end

    it "stops a plane from docking if stormy" do
      allow(airport).to receive(:stormy?).and_return(true)
      plane = Plane.new
      expect { subject.dock(plane) }.to raise_error "Weather Stormy!! Planes cannot land/dock"
    end
  end

  # Tests for preventing a plane docking if airport full
  context "Traffic Control gives permission for landing/taking off depending on capacity" do
    it "stops a plane for landing/docking if airport is full" do
      allow(airport).to receive(:stormy?).and_return(false)
      5.times { subject.dock(Plane.new) }
      expect { subject.dock(Plane.new) }.to raise_error "Airport is full, cannot land"
    end

    it "a plane cannot launch if there are no planes in airport" do
      allow(airport).to receive(:stormy?).and_return(false)
      expect { subject.launch(Plane.new) }.to raise_error "There are no planes in the airport"
    end
  end

end
