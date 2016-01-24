require "control_tower"


describe ControlTower do
  it "creates an instance of the class" do 
    expect(subject).to be_a ControlTower
  end
  
  it { is_expected.to respond_to(:land).with(2).arguments }
  it { is_expected.to respond_to(:take_off).with(2).arguments }
  
  describe "#take-off" do
    it "changes the state (flying) of the plane to true" do
      plane = Plane.new
      heatrow = Airport.new "Heatrow"
      tower = ControlTower.new
      tower.take_off(plane, heatrow)
      expect(plane.flying).to eq true
    end
  end
end