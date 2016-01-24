require 'control_tower'


describe "Control Tower Feature: " do
  before(:each) do 
    @tower = ControlTower.new
    @plane = Plane.new
    @stansted = Airport.new "Stansted"
    @heatrow = Airport.new "Heatrow"
  end
  
  it "Instructs a plane to land at an airport" do
    @tower.take_off(@plane, @heatrow)
    expect(@tower.land(@plane, @stansted)).to eq "Unit 737-1 has successfully landed in Stansted"
  end
  
  it "Instructs a plane to take-off from an airport" do
    expect(@tower.take_off(@plane, @heatrow)).to eq "Unit 737-1 has successfully taken-off from Heatrow"
    expect(@heatrow.planes).to eq [] 
  end
end


