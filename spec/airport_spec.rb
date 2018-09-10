require 'airport'

describe Airport do

  describe "#take_off" do

    it "removes Plane object from Airport" do

      # Force stormy? to false
      allow(subject).to receive(:stormy?).and_return(false)
      Plane.new.land(subject)
      subject.take_off
      expect(subject.take_off).to eq(nil)

    end

    it "fails if stormy?" do

      # Force stormy? to true
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.take_off }.to raise_error("Too stormy to take off!")

    end

  end

  describe "#dock" do

    it "adds the Plane to the Airport" do

      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(false)
      plane.land(subject)
      expect(subject.take_off).to eq("#{plane} successfully taken off from #{subject}")

    end

  end

  describe "#initialize" do

    it "allows Airport to have a custom capacity set on initalize" do
      
      airport = Airport.new(20)
      allow(airport).to receive(:stormy?).and_return(false)
      20.times { Plane.new.land(airport) }
      expect { Plane.new.land(airport) }.to raise_error("Airport is full!")
  
    end

    it "sets a default capacity of 10 if none is supplied" do

      allow(subject).to receive(:rand).and_return(1)
      10.times { Plane.new.land(subject) }
      expect { Plane.new.land(subject) }.to raise_error("Airport is full!")
  
    end

  end

end
