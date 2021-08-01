require "./lib/control_tower.rb"

describe ControlTower do 
  
  it "checks the tower's channels are active in control of an airport" do
    expect(subject.airport).to be_instance_of(Airport)
  end

  it "sends instruction to land, plane changes status to airborne_green_land" do 
    plane_in_use = Planes.new
    subject.initiated_plane_comm(plane_in_use)
    subject.plane.commence_procedure(:airborne_request_land, :airborne_green_land)
    subject.initiated_plane_comm(subject.plane)
    expect(subject.plane.plane_now[:airborne_green_land]).to eq(:now)
  end

  it "sends instruction to take off, plane changes status to grounded_green_takeoff" do 
    plane_in_use = Planes.new
    subject.initiated_plane_comm(plane_in_use)
    subject.plane.commence_procedure(:grounded_request_takeoff, :grounded_green_takeoff)
    subject.initiated_plane_comm(subject.plane)
    expect(subject.plane.plane_now[:grounded_green_takeoff]).to eq(:now)
  end
end
