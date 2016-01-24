describe "Bonus Feature - " do 
  
  before do 
    @tower = ControlTower.new
    @plane1 = Plane.new
    @plane2 = Plane.new
    @stansted = Airport.new "Stansted"
    @gatwick = Airport.new "Gatwick"
  end
  
    it "takes-off and lands a number of planes" do
    @plane1.dock(@stansted)
    @plane2.dock(@stansted)
    allow(@stansted).to receive(:clear?) {true}
    @tower.take_off(@plane1, @stansted)
    @tower.take_off(@plane2, @stansted)
    expect(@stansted.planes).not_to include(@plane1, @plane2)
    
    allow(@gatwick).to receive(:clear?).and_return(true)
    @tower.land(@plane1, @gatwick)
    @tower.land(@plane2, @gatwick)
    expect(@gatwick.planes).to include(@plane1, @plane2)
   end
   
  
end