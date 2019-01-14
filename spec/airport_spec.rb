require 'airport'

RSpec.describe Airport do
  
  before(:each) do
    @weather = double('weather')
    allow(@weather).to receive(:stormy?).and_return(false)
    @airport = Airport.new(10, @weather)
    @plane = double('plane')
    allow(@plane).to receive(:land)
    allow(@plane).to receive(:landed)
    allow(@plane).to receive(:take_off)
  end

  it { is_expected.to respond_to(:land) }  
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  describe '#land' do
    
    it "can instruct a plane to land at an airport" do
      allow(@airport).to receive(:landing_checker).and_return(false)
      expect(@airport.land(@plane)).to eq [@plane] 
    end
    
    it "prevents landing when weather is stormy" do
      allow(@weather).to receive(:stormy?).and_return(true)
      expect { @airport.land(@plane) }.to raise_error("No landings permitted due to the storm")
    end
    
    it "prevents landing when airport is full" do
      airport = Airport.new(1, @weather)
      plane2 = double('a plane')
      allow(plane2).to receive(:land)
      allow(plane2).to receive(:landed)
      airport.land(@plane)
      expect { airport.land(plane2) }.to raise_error("No landings permitted due to the airport being full")
    end

    it "prevents planes that have already landed from landing anywhere again" do
      @airport.land(@plane)
      allow(@plane).to receive(:landed).and_return(true)
      expect { @airport.land(@plane) }.to raise_error("This plane has already landed")
    end

    it "prevents planes that have landed in an airport from landing again a different airport" do
      heathrow = Airport.new(5, @weather)
      schipol = Airport.new(5, @weather)
      heathrow.land(@plane)
      allow(@plane).to receive(:landed).and_return(true)
      expect { schipol.land(@plane) }.to raise_error("This plane has already landed")
    end
  end
  
  describe '#take_off' do
    
    it "can instruct a plane to take off and confirm that the plane has left the airport" do
      @airport.land(@plane)
      @airport.take_off(@plane)
      expect(@airport.planes_in_airport.include?(@plane)).to eq(false)
    end

    it "prevents take off when weather is stormy" do
      @airport.land(@plane)
      allow(@airport).to receive(:stormy).and_return(true)
      expect { @airport.take_off(@plane) }.to raise_error("No take offs permitted due to the storm")
    end

    it "ensures planes can only take off if they exist in the airport" do
      expect { @airport.take_off(@plane) }.to raise_error("This plane doesn't exist in the airport")
    end

    it "ensures planes can only take off from the airport they are in" do
      heathrow = Airport.new(10, @weather)
      schipol = Airport.new(10, @weather)
      heathrow.land(@plane)
      expect { schipol.take_off(@plane) }.to raise_error("This plane doesn't exist in the airport")      
    end
  end

  describe '#stormy' do
    it { is_expected.to respond_to(:stormy) }

    it "checks if weather is stormy" do
      allow(@weather).to receive(:stormy?).and_return(true)
      expect(@airport.stormy).to eq(true)
    end
  end  
end
