require 'control_tower'


describe "Feature Tests - " do
  
 before(:each) do 
    @tower = ControlTower.new
    @plane_test = Plane.new
    @stansted = Airport.new "Stansted"
    @heatrow = Airport.new "Heatrow"
  end
  
  describe 'Control Tower:' do
  
  it "Instructs a plane to land at an airport" do
    
    allow(@stansted).to receive(:clear?) {true}
    allow(@heatrow).to receive(:clear?) {true}
    @plane_test.dock(@heatrow)
    @tower.take_off(@plane_test, @heatrow)
    expect(@tower.land(@plane_test, @stansted)).to eq "737-1 landed in Stansted"
  end
  
  it "Instructs a plane to take-off from an airport" do
    allow(@heatrow).to receive(:clear?) {true}
    allow(@plane_test).to receive(:name) {"737-1"}
    @plane_test.dock(@heatrow)
    expect(@tower.take_off(@plane_test, @heatrow)).to eq "737-1 took-off from Heatrow"
  end
 end
  
  describe "Airport: " do
    
    it "can check the weather before allowing landing" do
      @stansted.check_weather
      expect([:sunny, :windy, :rainy, :stormy]).to include(@stansted.weather) 
    end
    
    it "can check the weather before allowing taking-off" do
      @stansted.check_weather
      expect([:sunny, :windy, :rainy, :stormy]).to include(@stansted.weather)
    end
  end
end


