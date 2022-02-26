require 'airport'

describe Airport do
  describe ".land" do

    it "expects a plane to land at the airport" do
      destination = Airport.new
      expect(destination.land("BA101")).to eq ["BA101"]
    end

    it "does not allow to land if weather is stormy" do
        destination = Airport.new
        allow(destination).to receive(:rand).and_return(4)
        expect { destination.land("BA101") }.to raise_error "Stormy weather, cannot land"
  
      end

  end

  describe ".take_off" do

    it "expects the plane to take off from the airport" do
      departure = Airport.new
      allow(departure).to receive(:rand).and_return(3)
        departure.land("BA101")
      allow(departure).to receive(:rand).and_return(3)
      expect(departure.take_off("BA101")).to eq []
    end

    it "does not allow to take_off if weather is stormy" do
        departure = Airport.new
        allow(departure).to receive(:rand).and_return(3)
        departure.land("BA101")
        allow(departure).to receive(:rand).and_return(4)
        expect { departure.take_off("BA101") }.to raise_error "Stormy weather, cannot take off"
  
      end

      it "raises an error when .take_off is called and the airport is empty" do
        departure = Airport.new
        expect { departure.take_off("BA101") }.to raise_error "No planes in the airport"  
      end

  end

  describe ".full?" do
    it "prevents landing is airport is full" do
      destination = Airport.new(5)
      allow(destination).to receive(:rand).and_return(3)
      destination.land("BA101")
      destination.land("BA102")
      destination.land("BA103")
      destination.land("BA104")
      destination.land("BA105")
      expect { destination.land("BA101") }.to raise_error "Airport is full"
    end

  end
  
  describe "changing capacity" do
    it "changes the capacity according to users need" do
      destination = Airport.new(2)
      allow(destination).to receive(:rand).and_return(3)
      destination.land("BA101")
      expect(destination.land("BA105")).to eq  ["BA101", "BA105"]
    end

  end

end