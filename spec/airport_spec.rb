require 'airport'

describe Airport do
  let(:plane) { Plane.new }
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  context "instruct a plane to land at an airport" do
    it "responds to #land" do
      expect(subject).to respond_to(:land).with(1).arguments
    end
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  # COMPONENTS -> 1. Plane must be in airport; #2. Plane can take off from airport;
  # 3. Confirm plane no longer in airport
  context "holds a plane in an airport once it has landed" do
    it "returns a plane when passed the #land method" do
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
  end

  context "instructs a plane to take off from an airport" do
    it "responds to #take_off method" do
      expect(subject).to respond_to(:take_off)
    end
  end

  context "confirms plane no longer in airport" do
    it "changes status to 'in the air' when plane has taken off" do
      subject.land(plane)
      subject.take_off(plane)
      expect(plane.status).to eq "In the air"
    end
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when the airport is full
  context "raises an error if the airport is full" do
    it "returns error when airport already has one plane and another is added" do
      subject.land(plane)
      expect { subject.land(Plane.new) }.to raise_error "Airport is full, plane cannot be landed."
    end
  end

  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate
end
