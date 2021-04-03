require "airport"
# set the weather to sunny automatically or all tests
RSpec.configure do |config|
  config.before(:each) do
    allow(Weather).to receive(:stormy?) { false }
  end
end

describe Airport do
  let(:plane) { Plane.new }

  context "#land" do 
    it "Tests if a plane can land" do
      expect(subject).to respond_to :land
    end

    it "Tests if plane goes into hanger after landing" do
      expect { subject.land(plane) }.to change { subject.hanger.last }.to(plane)
    end

    it "Land sets flying variable to false for the plane object" do
      subject.land(plane)
      expect(plane.flying?).to be false
    end
  end

  context "#takeoff" do 
    it "Tests if a plane can takeoff" do
      expect(subject).to respond_to :takeoff
    end

    it "Tests if the plane is no longer in the hanger after takeoff" do
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.hanger).not_to include(plane)
    end

    it "Takeoff sets flying variable to true for the plane object" do
      subject.land(plane)
      subject.takeoff(plane)
      expect(plane.flying?).to be true
    end
  end

  context "#capacity" do 
    it "Receives error if airport is full" do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) } # Plane.new to prevent same plane landing error
      expect { subject.land(plane) }.to raise_error(RuntimeError, "The airport is full.")
    end

    it "Capacity can be changed" do 
      new_capacity = 50
      subject.change_capacity(new_capacity)
      expect(subject.capacity).to eq new_capacity
    end
  end

  context "#weather" do 
    it "Receives error landing if weather is stormy" do
      allow(Weather).to receive(:stormy?) { true }
      expect { subject.land(plane) }.to raise_error(RuntimeError, "The weather is stormy, no planes can land.")
    end

    it "Receives error taking off if weather is stormy" do
      allow(Weather).to receive(:stormy?) { true }
      expect { subject.takeoff(plane) }.to raise_error(RuntimeError, "The weather is stormy, no planes can takeoff.")
    end
  end

  context "Edge cases" do 
    it "Receive error if plane taking off is not in hanger" do
      expect { subject.takeoff(plane) }.to raise_error(RuntimeError, "The plane is not in the hanger. It cannot takeoff.")
    end

    it "Receive error if plane is already in the hanger" do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error(RuntimeError, "The plane is already in the hanger. It cannot land again.")
    end

    it "Receive error if plane taking off is already flying" do 
      p = double("plane", :flying? => true)
      allow(p).to receive(:land)
      subject.land(p)
      expect { subject.takeoff(p) }.to raise_error(RuntimeError, "The plane is already flying")
    end

    it "Receive error if plane landing is not flying" do
      p = double("plane", :flying? => false)
      expect { subject.land(p) }.to raise_error(RuntimeError, "The plane is not flying")
    end
  end
end
