require_relative '../lib/airport'

describe Airport do 
  let(:plane) { double :plane }

# User story 1
  describe "#land" do 
    it "instructs plane to land" do
      expect(subject).to respond_to(:land).with(1).argument
    end
# User story 3
    it "raises error when landing plane in full airport" do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
      10.times do
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error "Cannot land plane. Airport is full." 
    end

# User story 6
    it "prevents landing when weather is stormy" do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
      expect { subject.land(plane) }.to raise_error "Cannot land plane due to stormy weather." 
    end 
  end

# User story 2
  describe "#takeoff" do
    it "instructs plane to take off" do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
      expect(subject.takeoff(plane)).to eq("Plane has taken off.")
    end

# User story 5
    it "prevents takeoff when weather is stormy" do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
      expect { subject.takeoff(plane) }.to raise_error "Cannot takeoff plane due to stormy weather." 
    end 
  end

# User story 4
  it "has a default capacity that can be overridden" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY   
  end  

  it "can change capacity when instance of airport is created" do
    subject = Airport.new(20)
    expect(subject.capacity).to eq 20
  end
end
