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

  it "sends instruction to take off, plane reaches status of airborne_takingoff" do 
    plane_in_use = Planes.new
    subject.initiated_plane_comm(plane_in_use)
    subject.plane.commence_procedure(:grounded_request_takeoff, :grounded_green_takeoff)
    subject.initiated_plane_comm(subject.plane)
    subject.plane.commence_procedure(:airborne_takingoff, :airborne_pass)
    subject.initiated_plane_comm(subject.plane)
    expect(subject.plane.plane_now[:airborne_takingoff]).to eq(:now)
  end

  it "airport is_full should return true" do
    subject.airport.capacity.times{ subject.airport.grounded.push(Planes.new) }
    expect(subject.airport.is_full?).to eq(true)
  end

  it "plane fails to get airborne_green_land, instead is :airborne_red_land if airport is full" do
    subject.airport.capacity.times{ subject.airport.grounded.push(Planes.new) }
    plane_in_use = Planes.new
    subject.initiated_plane_comm(plane_in_use)
    subject.plane.commence_procedure(:airborne_request_land, :airborne_green_land)
    subject.initiated_plane_comm(subject.plane)
    expect(subject.plane.plane_now[:airborne_red_land]).to eq(:now)
  end

  it "should prevent the green flag(:now) for landing if the weather is :stormy" do
    plane_in_use = Planes.new
    subject.initiated_plane_comm(plane_in_use)
    subject.plane.commence_procedure(:airborne_request_land, :airborne_green_land)
    subject.initiated_plane_comm(subject.plane, :stormy)
    expect(subject.plane.plane_now[:airborne_green_land]).not_to be(:now)
  end

  it "should prevent the green flag(:now) for take off if the weather is :stormy" do 
    plane_in_use = Planes.new
    subject.initiated_plane_comm(plane_in_use)
    subject.plane.commence_procedure(:grounded_request_takeoff, :grounded_green_takeoff)
    subject.initiated_plane_comm(subject.plane, :stormy)
    expect(subject.plane.plane_now[:grounded_green_takeoff]).not_to be(:now)
  end

  it "adds plane to airport grounded list when plane landed" do
    plane_in_use = Planes.new
    subject.initiated_plane_comm(plane_in_use)
    subject.plane.commence_procedure(:grounded_landing, :passengers_out)
    subject.initiated_plane_comm(subject.plane)
    expect(subject.airport.grounded[0]).to eq(plane_in_use)
  end

  it "removes plane from airport grounded list when plane took off" do
    plane_in_use = Planes.new
    # plane landed
    subject.initiated_plane_comm(plane_in_use)
    subject.plane.commence_procedure(:grounded_landing, :passengers_out)
    subject.initiated_plane_comm(subject.plane)
    # plane took off 
    subject.initiated_plane_comm(plane_in_use)
    subject.plane.commence_procedure(:airborne_takingoff, :airborne_pass)
    subject.initiated_plane_comm(subject.plane)
    expect(subject.airport.grounded.count(plane_in_use)).to eq(0)
  end
end
