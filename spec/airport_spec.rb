require_relative "../lib/airport.rb"
require_relative "../lib/plane.rb"

describe Airport do
  describe "#land" do
    it "responds to land plane method" do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it "lands a plane" do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end  
    it "raises an error when the hangar is full(hangar_capacity in hangar)" do
      subject.hangar_capacity.times{subject.land(Plane.new)}
      expect{subject.land(Plane.new)}.to raise_error("Cannot land, Airport is full")
    end
  end

  describe "#take_off" do
    it "responds to take_off plane method" do
      expect(subject).to respond_to(:take_off)
    end
    
    it "allows a landed plane to take_off from hangar" do
      subject.land(Plane.new)
      expect(subject.take_off).to be_instance_of(Plane)
    end
  end  
    
  describe "#in_airport?" do
    it "checks whether plane has indeed taken off" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off
      expect(subject.in_airport?(plane)).to be false
    end  

    it "checks whether plane in the airport/hangar" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.in_airport?(plane)).to be true
    end 
  end  
end