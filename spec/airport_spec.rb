require "airport"

describe Airport do 
  
  describe "#basic function checks" do

    it "weather gives true or false" do
      expect(subject.weather?).to eq(true).or(eq(false)) 
    end 

    it "has default capacity" do
      expect(subject.capacity).to eq(20)
    end 

    it "sets capacity" do
      subject.capacity = 150
      expect(subject.capacity).to eq(150)
    end 

  end

  describe "#landing and take off" do

    let(:plane) { double(:plane) }

    before { allow(subject).to receive(:weather?) { false } }
    before { allow(plane).to receive(:dock) { false } }
    before { allow(plane).to receive(:undock) { false } }

    it "prevents landing when airport if full" do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land double(plane) }.to raise_error "No space at the airport!"
    end

    it "shows error when plane is not docked" do
      expect { subject.take_off(plane) }.to raise_error "Plane is not at the airport"
    end

    it "land plane when weather is clear" do
      expect(subject.land(plane)).to include(plane)
    end

    it "prevents landing when weather is poor" do
      allow(subject).to receive(:weather?) { true }
      expect { subject.land(plane) }.to raise_error "Poor weather!"
    end

    it "allow take off when weather is clear" do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to_not include(plane)
    end

    it "stop plane taking off when weather is poor" do
      allow(subject).to receive(:weather?) { true }
      expect { subject.land(plane) }.to raise_error "Poor weather!"
    end
  
  end

end
