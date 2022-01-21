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
    new_plane = Plane.new(true)
    subject.land_plane(new_plane)
    expect(subject.airport_storage).to include(new_plane)
  end

  it "Removes plane from storage upon takeoff" do
    new_plane = Plane.new(true)
    new_plane.land_at_airport(subject)
    new_plane.takeoff_from_airport(subject)
    expect(subject.airport_storage).not_to include(new_plane)
  end

  it "Prevents landing if airport is full" do
    10.times { subject.land_plane Plane.new(true) }
    expect { subject.land_plane(Plane.new(true)) }.to raise_error "Storage full"
  end

  it "Prevents landing when full for custom capacity" do
    new_airport = Airport.new(5)
    5.times { new_airport.land_plane(Plane.new(true)) }
    expect { new_airport.land_plane(Plane.new(true)) }.to raise_error "Storage full"
  end

  it "Doesn't land plane that is already landed" do
    expect { subject.land_plane(Plane.new) }.to raise_error "Plane not flying"
  end

#  it "Doesn't send plane that is already flying" do
#    test_airport = double(Airport.new)
#    new_plane = Plane.new(true)
#    subject.land_plane(new_plane)
#    new_plane.takeoff_from_airport(subject)
#    expect { subject.send_plane(new_plane) }.to raise_error "Plane already flying"
#  end

end
