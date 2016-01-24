require 'control_tower'


describe "Feature Tests - " do
  
  before(:all) do 
    @tower = ControlTower.new
    @plane = Plane.new
    @stansted = Airport.new "Stansted"
    @heatrow = Airport.new "Heatrow"
  end
  
  describe 'Control Tower:' do
  
  it "Instructs a plane to land at an airport" do
    @tower.take_off(@plane, @heatrow)
    expect(@tower.land(@plane, @stansted)).to satisfy {|x| x.is_a?(String)}
  end
  
  it "Instructs a plane to take-off from an airport" do
    expect(@tower.take_off(@plane, @heatrow)).to satisfy {|x| x.is_a?(String)}
    expect(@heatrow.planes).to eq [] 
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


