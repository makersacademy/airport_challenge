require 'airport'

describe Airport do

  it "should raise an error when attempting to add new planes to a full airport" do
    plane1 = Plane.new
    plane2 = Plane.new
    full_airport = Airport.new("Heathrow", 1)
    full_airport.add_plane_to_airport(plane1)
    expect { full_airport.add_plane_to_airport(plane2) }.to raise_error "Airport is full!"
  end

  it "should return the plane object and its gate number" do
    plane = Plane.new
    subject.add_plane_to_airport(plane)
    expect(subject.plane_at_airport?(plane)).to eql("Plane is at Gate 1")
  end

  it "should return a statement saying that the specified plane is not at the airport" do
    plane = Plane.new
    expect(subject.plane_at_airport?(plane)).to eql("Plane is not at this airport")
  end

  it "should raise an error specifying that weather could not be read" do
    fake_weather = double("fake_weather")
    plane = Plane.new
    expect { subject.accept_landing(plane, fake_weather) }.to raise_error "Could not check weather!"
  end

  it "should raise an error if weather is too stormy for landing" do
    weather = Weather.new
    weather.instance_variable_set("@state", 2)
    plane = Plane.new
    expect { subject.accept_landing(plane, weather) }.to raise_error "Weather is stormy!"
  end

  it "should raise an error saying that the airport is full" do
    plane1 = Plane.new
    plane2 = Plane.new
    full_airport = Airport.new("Heathrow", 1)
    weather = Weather.new
    weather.instance_variable_set("@state", 1)
    full_airport.add_plane_to_airport(plane1)
    expect { full_airport.accept_landing(plane2, weather) }.to raise_error "Airport is full!"
  end

  it "should raise an error specifying that weather could not be read" do
    fake_weather = double("fake_weather")
    plane = Plane.new
    expect { subject.take_off(plane, fake_weather) }.to raise_error "Could not check weather!"
  end

  it "should raise an error if weather is too stormy for take off" do
    weather = Weather.new
    plane = Plane.new
    full_airport = Airport.new("Heathrow", 2)
    weather.instance_variable_set("@state", 1)
    full_airport.accept_landing(plane, weather)
    weather.instance_variable_set("@state", 2)
    expect { full_airport.take_off(plane, weather) }.to raise_error "Weather is stormy!"
  end

  it "should raise an error for gate number specified for take off" do
    gate_number = 1
    weather = Weather.new
    weather.instance_variable_set("@state", 1)
    expect { subject.take_off(gate_number, weather) }.to raise_error "Plane is not at this airport!"
  end

  it "should return true, for successful plane take off and flight status as true" do
    weather = Weather.new
    weather.instance_variable_set("@state", 1)
    subject.add_plane_to_airport(Plane.new)
    expect(subject.take_off(1, weather)).to eql(true)
  end

end
