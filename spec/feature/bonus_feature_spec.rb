describe "Bonus Feature - " do 
  
  before do 
    @tower = ControlTower.new
    @plane1 = Plane.new
    @plane2 = Plane.new
    @stansted = Airport.new "Stansted"
    @gatwick = Airport.new "Gatwick"
  end
  
  describe 'takes-off and lands a number of planes' do
    it "takes-off two planes from Stansted airport" do
    @plane1.dock(@stansted)
    @plane2.dock(@stansted)
    allow(@stansted).to receive(:clear?) {true}
    @tower.take_off(@plane1, @stansted)
    @tower.take_off(@plane2, @stansted)
    expect(@stansted.planes).not_to include(@plane1, @plane2)
   end
  end
  
end