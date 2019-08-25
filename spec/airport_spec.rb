require "airport.rb"

describe Airport do
  #Default tests never get stormy weather returned
  subject { Airport.new(0) }

  it "Test allow airplane to land at airport" do
    plane1 = Plane.new
    expect(subject.land_plane(plane1)).to eq ([plane1])
  end

  it "Allows a plane to take off and confirm false that its not in the airport" do
    plane1 = Plane.new
    subject.land_plane(plane1)
    expect(subject.takeoff_plane(plane1)).to eq (false)
  end

  it "Returns true if arrived plane is at the airport" do
    plane1 = Plane.new
    subject.land_plane(plane1)
    expect(subject.plane_in_airport?(plane1)).to eq(true)
  end

  it "Returns false if the plane is not at the airport" do
    plane1 = Plane.new
    plane2 = Plane.new
    subject.land_plane(plane1)
    expect(subject.plane_in_airport?(plane2)).to eq(false)
  end

  it "The weather returns true when 0% chance of storm" do
    expect(subject.is_it_sunny?).to eq(true)
  end

  it "The weather returns false when 100% chance of storm" do
    airport = Airport.new(100)
    expect(airport.is_it_sunny?).to eq(false)
  end

  it "The plane can't take off if it's stormy" do
    plane1 = Plane.new
    subject.instance_variable_set(:@planes_in_airport, [plane1])
    subject.instance_variable_set(:@storm_chance_percentage, 100)
    expect {subject.takeoff_plane(plane1)}.to raise_error("It's too Stormy to take off")
  end

  it "The plane can't land if it's stormy" do
    airport = Airport.new(100)
    plane1 = Plane.new
    expect {airport.land_plane(plane1)}.to raise_error("It's too Stormy to land")
  end

  it "If the airport is full, with defauly capacity of 3, don't allow a plane to land" do
    3.times {subject.land_plane(Plane.new)}
    expect{subject.land_plane(Plane.new)}.to raise_error("Airport is full")
  end

  it "If the airport is full, with override capacity of 100, don't allow a plane to land" do
    airport = Airport.new(0,100)
    100.times {airport.land_plane(Plane.new)}
    expect{airport.land_plane(Plane.new)}.to raise_error("Airport is full")
  end
end
