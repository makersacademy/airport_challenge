require 'airport'

describe Airport do
  describe ".land" do

    it "expects a plane to land at the airport" do
      bangalore_airport = Airport.new
      allow(bangalore_airport).to receive(:rand).and_return(2)
      expect(bangalore_airport.land("BA101")).to eq ["BA101"]
    end

    it "does not allow to land if weather is stormy" do
      bangalore_airport = Airport.new
      allow(bangalore_airport).to receive(:rand).and_return(3)
      expect { bangalore_airport.land("BA101") }.to raise_error "Stormy weather, cannot land"
  
    end

    it "raises an error when user tries to land an already landed plane" do
      bangalore_airport = Airport.new
      allow(bangalore_airport).to receive(:rand).and_return(2)
      expect { bangalore_airport.land("BA101", "BA102", "BA101") }.to raise_error "Cannot land a already landed plane"
    end

    it "lands multiple planes at a time" do
      bangalore_airport = Airport.new
      allow(bangalore_airport).to receive(:rand).and_return(2)
      expect(bangalore_airport.land("BA101", "BA102")).to eq ["BA101", "BA102"]
    end

  end

  describe ".take_off" do

    it "expects the plane to take off from the airport" do
      heathrow_airport = Airport.new
      allow(heathrow_airport).to receive(:rand).and_return(2)
      heathrow_airport.land("BA101")
      allow(heathrow_airport).to receive(:rand).and_return(2)
      expect(heathrow_airport.take_off("BA101")).to eq []
    end

    it "does not allow to take_off if weather is stormy" do
      heathrow_airport = Airport.new
      allow(heathrow_airport).to receive(:rand).and_return(2)
      heathrow_airport.land("BA101")
      allow(heathrow_airport).to receive(:rand).and_return(3)
      expect { heathrow_airport.take_off("BA101") }.to raise_error "Stormy weather, cannot take off"
  
    end

    it "raises an error when .take_off is called and the airport is empty" do
      heathrow_airport = Airport.new
      expect { heathrow_airport.take_off("BA101") }.to raise_error "No planes in the airport"  
    end  

    it "does not allow to take_off if the plane is not at the airport" do
      heathrow_airport = Airport.new
      allow(heathrow_airport).to receive(:rand).and_return(2)
      heathrow_airport.land("BA101", "BA103")
      allow(heathrow_airport).to receive(:rand).and_return(2)
      expect { heathrow_airport.take_off("BA101", "BA102") }.to raise_error "Plane not at the airport"  
    end

    
    it "allows multiple take offs" do
      heathrow_airport = Airport.new
      allow(heathrow_airport).to receive(:rand).and_return(2)
      heathrow_airport.land("BA101", "BA103", "BA102")
      allow(heathrow_airport).to receive(:rand).and_return(2)
      expect(heathrow_airport.take_off("BA101", "BA102")).to eq ["BA103"]
  
    end    

  end

  describe ".full?" do
    it "prevents landing is airport is full" do
      bangalore_airport = Airport.new(2)
      allow(bangalore_airport).to receive(:rand).and_return(2)
      bangalore_airport.land("BA101")
      bangalore_airport.land("BA102")
      expect { bangalore_airport.land("BA106") }.to raise_error "Airport is full"
    end

  end
  
  describe "changing capacity" do
    it "changes the capacity according to users need" do
      bangalore_airport = Airport.new(2)
      allow(bangalore_airport).to receive(:rand).and_return(2)
      bangalore_airport.land("BA101")
      expect(bangalore_airport.land("BA105")).to eq ["BA101", "BA105"]
    end

  end

end
