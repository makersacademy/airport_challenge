require 'plane'

describe Plane do

  it "A plane will respond to the method asking it to land at an airport" do
    plane = Plane.new
    expect(plane).to respond_to :land
  end

  it "A plane will respond to the method asking it to take off from an airport" do
    plane = Plane.new
    expect(plane).to respond_to :take_off
  end

  it "Once a plane has landed, it should no longer be in the air, and once taken off in the air" do
    plane = Plane.new
    plane.land
    plane.land_in_airport("Heathrow")
    expect(plane.in_air).to eq false
    plane.take_off
    expect(plane.in_air).to eq true
  end

  it "A plane knows if it's in an airport or not" do
    plane = Plane.new
    expect(plane).to respond_to :in_airport
  end

  it "If a plane is already landed, it will not land again" do
    plane = Plane.new
    plane.land
    expect { plane.land }.to raise_error("The plane has already landed!")
  end

  it "If a plane has already taken off, it will not take off again" do
    plane = Plane.new
    plane.land
    plane.land_in_airport("Heathrow")
    plane.take_off
    expect { plane.take_off }.to raise_error("The plane is already in the air!")
  end

  it "A plane knows the airport it is in" do
    plane = Plane.new
    plane.land
    plane.airport_in("Heathrow")
    expect(plane.airport_at).to eq("Heathrow")
  end

  it "A plane that has landed, but not at an airport has crashed and cannot take off" do
    plane = Plane.new
    plane.land
    expect { plane.take_off }.to raise_error("You can't take off from nowhere! You must have crashed!")
  end
end
