require 'airport'

RSpec.describe Airport do

  # it { is_expected.to respond_to(:plane_in_airport?) }
  
  describe '#land' do
    it { is_expected.to respond_to(:land) }  
    it { is_expected.to respond_to(:land).with(1).argument }
    
    it "can instruct a plane to land at an airport" do
      airport = Airport.new
      allow(airport).to receive(:stormy).and_return(false)
      plane = double('a plane')
      allow(plane).to receive(:land)
      allow(airport).to receive(:landing_checker).and_return(false)
      expect(airport.land(plane)).to eq [plane] 
    end
    
    it "prevents landing when weather is stormy" do
      airport = Airport.new
      plane = double('a plane')
      allow(plane).to receive(:landed)
      allow(airport).to receive(:stormy).and_return(true)
      expect { airport.land(plane) }.to raise_error("No landings permitted due to the storm")
    end
    
    it "prevents landing when airport is full" do
      airport = Airport.new(1)
      allow(airport).to receive(:stormy).and_return(false)
      plane = double('a plane')
      plane2 = double('a plane')
      allow(plane).to receive(:land)
      allow(plane2).to receive(:land)
      allow(plane).to receive(:landed)
      allow(plane2).to receive(:landed)
      airport.land(plane)
      expect { airport.land(plane2) }.to raise_error("No landings permitted due to the airport being full")
    end

    it "prevents planes that have already landed from landing anywhere again" do
      airport = Airport.new(5)
      allow(airport).to receive(:stormy).and_return(false)
      plane = double('a plane')
      allow(plane).to receive(:land)
      allow(plane).to receive(:landed)
      airport.land(plane)
      allow(plane).to receive(:landed).and_return(true)
      expect { airport.land(plane) }.to raise_error("This plane has already landed")
    end

    it "prevents planes that have landed in an airport from landing again a different airport" do
      heathrow = Airport.new(5)
      schipol = Airport.new(5)
      allow(heathrow).to receive(:stormy).and_return(false)
      allow(schipol).to receive(:stormy).and_return(false)
      plane = double('a plane')
      allow(plane).to receive(:land)
      allow(plane).to receive(:landed)
      heathrow.land(plane)
      allow(plane).to receive(:landed).and_return(true)
      expect { schipol.land(plane) }.to raise_error("This plane has already landed")
    end
  end
  
  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }
    it { is_expected.to respond_to(:take_off).with(1).argument }
    
    it "can instruct a plane to take off and confirm that the plane has left the airport" do
      airport = Airport.new
      allow(airport).to receive(:stormy).and_return(false)
      plane = double('a plane')
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      allow(plane).to receive(:landed)
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes_in_airport.include?(plane)).to eq(false)
    end

    it "prevents take off when weather is stormy" do
      airport = Airport.new
      plane = double('a plane')
      allow(airport).to receive(:stormy).and_return(false)
      allow(plane).to receive(:land)
      allow(plane).to receive(:landed)
      airport.land(plane)
      allow(airport).to receive(:stormy).and_return(true)
      expect { airport.take_off(plane) }.to raise_error("No take offs permitted due to the storm")
    end

    it "ensures planes can only take off if they exist in the airport" do
      airport = Airport.new
      allow(airport).to receive(:stormy).and_return(false)
      plane = double('a plane')
      expect { airport.take_off(plane) }.to raise_error("This plane doesn't exist in the airport")
    end

    it "ensures planes can only take off from the airport they are in" do
      heathrow = Airport.new
      schipol = Airport.new
      plane111 = double('a plane')
      allow(plane111).to receive(:land)
      allow(plane111).to receive(:landed)
      allow(heathrow).to receive(:stormy).and_return(false)
      allow(schipol).to receive(:stormy).and_return(false)
      heathrow.land(plane111)
      expect { schipol.take_off(plane111) }.to raise_error("This plane doesn't exist in the airport")      
    end
  end

  describe '#stormy' do
    it { is_expected.to respond_to(:stormy) }

    it "checks if weather is stormy" do
      airport = Airport.new
      allow(airport).to receive(:stormy).and_return(true)
      expect(airport.stormy).to eq(true)
    end
  end  
end
