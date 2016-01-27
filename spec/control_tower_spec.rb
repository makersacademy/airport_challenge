require "control_tower"
require "airport"


describe ControlTower do
  
  subject(:tower) { described_class.new }
  
  let(:plane)     { Plane.new }
  let(:airport)   { Airport.new(name, capacity)}
  
  let(:name) { "Heatrow" }
  let(:capacity) { 3 }
    
    
    before(:each) do 
      
    end
    
  
  it { is_expected.to respond_to(:land).with(2).arguments }
  
  it { is_expected.to respond_to(:take_off).with(2).arguments }
  
  it "receives confirm of landing in clear weather" do
    allow(airport).to receive(:clear?).and_return(true)
    allow(plane).to receive(:flying).and_return(true)
    expect(tower.land(plane, airport)).to eq "737-1 landed in Heatrow"
  end
  
  it "receives confirm of take-off in clear weather" do
    allow(tower).to receive(:take_off) do |plane, airport|
      "737-1 took-off from Heatrow"
    end
    expect(tower.take_off(plane, airport)).to eq "737-1 took-off from Heatrow"
  end
  
  it "Does not clear for take-off in stormy weather" do
    allow(airport).to receive(:check_weather).and_return(:stormy)
    allow(airport).to receive(:clear?).and_return(false)
    allow(airport).to receive(:planes).and_return([plane])
    expect(tower.take_off(plane, airport)).to eq "Cannot operate in Heatrow, stormy weather"
  end
  
  it "Does not clear for landing in stormy weather" do
    allow(airport).to receive(:check_weather).and_return(:stormy)
    allow(airport).to receive(:clear?).and_return(false)
    allow(plane).to receive(:flying).and_return(true)
    allow(airport).to receive(:full?).and_return(false)
    expect(tower.land(plane, airport)).to eq "Cannot operate in Heatrow, stormy weather"
  end
  
  it "Does not clear for landing if the airport is full" do
     allow(airport).to receive(:check_weather).and_return(:rainy)
     allow(airport).to receive(:full?).and_return(true)
    expect(tower.land(plane, airport)).to eq "Cannot land in Heatrow, the airport is full" 
  end
  
  
  describe "#take-off" do
  
    it "receives information about the weather" do
      allow(airport).to receive(:check_weather).and_return(:rainy)
      expect(airport.check_weather).to be_a Symbol
    end
    
  end
  
  describe "#land" do
    
    it "receives information about the weather" do
      allow(airport).to receive(:check_weather).and_return(:rainy)
      expect(airport.check_weather).to be_a Symbol
    end
    
    it "cannot be instructed if a plane is not flying" do
      allow(airport).to receive(:check_weather).and_return(:rainy)
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:name).and_return("Heatrow")
      expect(tower.land(plane, airport)).to eq "737-6 is not flying" 
      
    end
  end
  
  
end