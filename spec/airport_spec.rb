require 'airport'

describe Airport do
  describe ".land" do
    # it "expects a plane to land at the airport" do
    #   destination = Airport.new
    #   expect(destination.land("BA101")).to eq "BA101 has landed"
    # end

    it "expects a plane to land at the airport" do
      destination = Airport.new
      expect(destination.land("BA101")).to eq ["BA101"]
    end

  end

  describe ".take_off" do
    # it "expects the plane to take off from the airport" do
    #   departure = Airport.new
    #   expect(departure.message("BA101")).to eq "BA101 has taken off"
    # end

    # it "expects the plane to take off from the airport" do
    #     departure = Airport.new
    #     departure.take_off("BA101")
    #     expect(departure.check).to eq nil
    # end

    it "expects the plane to take off from the airport" do
      departure = Airport.new
      expect(departure.take_off("BA101")).to eq []
    end

  end

  describe ".full?" do
    it "prevents landing is airport is full" do
      destination = Airport.new(5)
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
      destination = Airport.new(5)
      allow(destination).to receive(:rand).and_return(3)
      destination.land("BA101")
      destination.land("BA102")
      destination.land("BA103")
      destination.land("BA104")
      expect(destination.land("BA105")).to eq  ["BA101", "BA102", "BA103", "BA104", "BA105"]
    end

  end

  describe "weather" do
    it "checks for the weather while taking off" do
      departure = Airport.new
      allow(departure).to receive(:rand).and_return(4)
      expect { departure.take_off("BA101") }.to raise_error "Stormy weather, cannot take off"

    end
    
  end


end