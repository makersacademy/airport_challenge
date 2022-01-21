require "airport"

describe Airport do

  it "Instructs plane to land" do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it "override airport capacity" do
    new_airport = Airport.new(5)
    expect(new_airport.plane_capacity).to eq 5
  end

  it "fails to send plane if not in storage" do
    expect { subject.send_plane(Plane.new) }.to raise_error "Plane not in storage"
  end

  it "stores landed plane" do
    new_plane = Plane.new
    subject.land_plane(new_plane)
    expect(subject.plane_storage).to include(new_plane)
  end

  it "Removes plane from storage upon takeoff" do
    new_plane = Plane.new
    subject.land_plane(new_plane)
    subject.send_plane(new_plane)
    expect(subject.plane_storage).not_to include(new_plane)
  end

  it "Prevents landing if airport is full" do
    10.times { subject.land_plane Plane.new }
    expect { subject.land_plane(Plane.new) }.to raise_error "Storage full"
  end

  it "Prevents landing when full for custom capacity" do
    new_airport = Airport.new(5)
    5.times { new_airport.land_plane(Plane.new) }
    expect { new_airport.land_plane(Plane.new) }.to raise_error "Storage full"
  end

end
