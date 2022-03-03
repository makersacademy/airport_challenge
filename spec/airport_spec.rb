require_relative '../lib/airport'

describe Airport do 
let(:plane) {double :plane}

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport
  describe "#land" do 
    it "instructs plane to land" do
      expect(subject).to respond_to(:land).with(1).argument
    end
# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 
    it "raises error when landing plane in full airport" do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
      10.times do
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error "Cannot land plane. Airport is full" 
    end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 
    it "prevents landing when weather is stormy" do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
      expect { subject.land(plane) }.to raise_error "Cannot land plane due to stormy weather" 
    end 
  end

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  describe "#takeoff" do
    it "instructs plane to take off" do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
      expect(subject.takeoff(plane)).to eq("Plane has taken off")
    end

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 
    it "prevents takeoff when weather is stormy" do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
      expect { subject.takeoff(plane) }.to raise_error "Cannot takeoff plane due to stormy weather" 
    end 
  end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate
  it "has a default capacity that can be overridden" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY   
  end  

  it "can change capacity when instance of airport is created" do
    subject = Airport.new(20)
    expect(subject.capacity).to eq 20
  end
end
