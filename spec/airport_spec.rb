require 'airport'

describe Airport do

  describe "#take_off" do

    it "removes Plane object from Airport" do

      # Force stormy? to false
      allow(subject).to receive(:rand).and_return(1)
      airbus = Plane.new.land(subject)
      subject.take_off
      expect(subject.planes).to eq([])

    end

    it "fails if stormy?" do

      # Force stormy? to true
      allow(subject).to receive(:rand).and_return(7)
      expect { subject.take_off }.to raise_error("Too stormy to take off!")

    end

  end

  describe "#dock" do

    it "adds the Plane to the Airport" do

      plane = Plane.new
      allow(subject).to receive(:rand).and_return(1)
      plane.land(subject)
      expect(subject.planes).to eq([plane])

    end

  end

  describe "#initialize" do

    it "allows Airport to have a custom capacity set on initalize" do
      
      heathrow = Airport.new(20)
      allow(heathrow).to receive(:rand).and_return(1)
      20.times { Plane.new.land(heathrow) }
      expect { Plane.new.land(heathrow) }.to raise_error("Airport is full!")
  
    end

    it "sets a default capacity of 10 if none is supplied" do

      allow(subject).to receive(:rand).and_return(1)
      10.times { Plane.new.land(subject) }
      expect { Plane.new.land(subject) }.to raise_error("Airport is full!")
  
    end

  end

end