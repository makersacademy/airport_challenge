require "control_tower"


describe ControlTower do
  before(:each) do
    @plane = Plane.new
    @heatrow = Airport.new "Heatrow"
    @tower = ControlTower.new
  end
  
  it "creates an instance of the class" do 
    expect(subject).to be_a ControlTower
  end
  
  it { is_expected.to respond_to(:land).with(2).arguments }
  it { is_expected.to respond_to(:take_off).with(2).arguments }
  
  describe "#take-off" do
  
    it "receives information about the weather" do
      expect(@heatrow.check_weather).to be_a Symbol
    end
  end
  
  describe "#land" do
    
    it "receives information about the weather" do
      expect(@heatrow.check_weather).to be_a Symbol
    end
  end
  
  describe "#report" do
    
    it "triggers Plane's flying state" do
      @tower.take_off(@plane, @heatrow)
      expect(@plane.flying).to eq true
    end
  end
  
end