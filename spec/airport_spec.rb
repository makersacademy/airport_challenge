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
      allow(subject).to receive(:rand).and_return(1)
      expect(heathrow.capacity).to eq(20)
  
    end

    it "sets a default capacity of 10 if none is supplied" do

      heathrow = Airport.new
      expect(heathrow.capacity).to eq(10)
  
    end

  end

end