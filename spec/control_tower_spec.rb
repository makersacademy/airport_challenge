require "./lib/control_tower.rb"

describe ControlTower do 

  it "checks the tower's channels are active in control of an airport" do
    expect(subject.airport).to be_instance_of(Airport)
  end

end
