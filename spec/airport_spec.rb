require 'airport'

describe Airport do

  describe "#initialize" do  
    subject { Airport.new }
    let(:plane) { Plane.new }

  # I would like a default airport capacity (I have chosen default of 25)
    it "Airport has a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

  # I would like the default capacity to be overridden as appropriate
    it "Airport has a variable capacity" do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect { subject.land Plane.new }.to raise_error "Airport is full, landing prevented"
    end

  end
  
  describe "#land" do
    it "Airport responds to land" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    # I want to instruct a plane to land at an airport
    it "Lands a plane at the airport" do
      plane = Plane.new
      expect(subject.land(plane)).to eq([plane])
    end

    # I want to prevent landing when the airport is full
    it "Raises error if airport is full" do
      subject.capacity.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error "Airport is full, landing prevented"
    end

  end

  describe "#take_off" do
    it "Airport reponds to take off" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    # I want to instruct a plane to take off from an airport
    it "A plane takes off from the airport" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    # I want to confirm that it is no longer in the airport
    it "Confirms that a plane is no longer in the airport" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.confirmation).to eq("Plane has left the airport")
    end
  end

end

# User stories

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy
