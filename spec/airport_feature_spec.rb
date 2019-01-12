require 'airport'

describe Airport do

  it "should raise an error specifying that weather could not be read" do
    fake_weather = double("fake_weather")
    plane = Plane.new(1)
    expect { subject.accept_landing(plane, fake_weather) }.to raise_error "Could not check weather!"
  end

  it "should raise an error if weather is too stormy for landing" do
    weather = Weather.new
    weather.instance_variable_set("@state", 2)
    plane = Plane.new(1)
    expect { subject.accept_landing(plane, weather) }.to raise_error "Weather is stormy!"
  end

  it "should raise an error saying that the airport is full" do
    plane1 = Plane.new(1)
    plane2 = Plane.new(2)
    full_airport = Airport.new("Heathrow", 1)
    weather = Weather.new
    weather.instance_variable_set("@state", 1)
    full_airport.accept_landing(plane1, weather)
    expect { full_airport.accept_landing(plane2, weather) }.to raise_error "Airport is full!"
  end

  it "should raise an error specifying that weather could not be read" do
    fake_weather = double("fake_weather")
    plane = Plane.new(1)
    expect { subject.take_off(plane, fake_weather) }.to raise_error "Could not check weather!"
  end

  it "should raise an error if weather is too stormy for take off" do
    weather = Weather.new
    plane = Plane.new(1)
    full_airport = Airport.new("Heathrow", 1)
    weather.instance_variable_set("@state", 1)
    full_airport.accept_landing(plane, weather)
    weather.instance_variable_set("@state", 2)
    expect { full_airport.take_off(plane, weather) }.to raise_error "Weather is stormy!"
  end

  it "should raise an error for incorrect plane number take off" do
    plane1 = Plane.new(1)
    plane2 = Plane.new(2)
    weather = Weather.new
    weather.instance_variable_set("@state", 1)
    subject.accept_landing(plane1, weather)
    expect { subject.take_off(plane2, weather) }.to raise_error "Plane is not at this airport!"
  end

end
