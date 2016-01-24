require "control_tower"


describe ControlTower do
  before(:each) do
    @plane = double(:plane)
    @heatrow = double(:airport)
    @tower = ControlTower.new
  end
  
  it "creates an instance of the class" do 
    expect(subject).to be_a ControlTower
  end
  
  it { is_expected.to respond_to(:land).with(2).arguments }
  it { is_expected.to respond_to(:take_off).with(2).arguments }
  
  it "clears to land in clear weather" do
    allow(@tower).to receive(:land) do |plane, airport|
      "737-1 landed in Stansted"
    end
    expect(@tower.land(@plane, @airport)).to eq "737-1 landed in Stansted"
  end
  it "Clears for take-off in clear weather" do
    allow(@tower).to receive(:take_off) do |plane, airport|
      "737-1 took-off from Stansted"
    end
    expect(@tower.take_off(@plane, @airport)).to eq "737-1 took-off from Stansted"
  end
  
  describe "#take-off" do
  
    it "receives information about the weather" do
      allow(@heatrow).to receive(:check_weather).and_return(:rainy)
      expect(@heatrow.check_weather).to be_a Symbol
    end
  end
  
  describe "#land" do
    
    it "receives information about the weather" do
      allow(@heatrow).to receive(:check_weather).and_return(:rainy)
      expect(@heatrow.check_weather).to be_a Symbol
    end
  end
  
  describe "#report" do
    
    it "triggers Plane's flying state" do
      allow(@plane).to receive(:flying).and_return(true)
      allow(@plane).to receive(:flying=).with(false)
      allow(@heatrow).to receive(:check_weather).and_return(:rainy)
      allow(@heatrow).to receive(:clear?).and_return(true)
      allow(@heatrow).to receive(:name)
      @tower.take_off(@plane, @heatrow)
      expect(@plane.flying).to eq true
    end
  end
  
end