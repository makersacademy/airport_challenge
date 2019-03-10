require 'airport'
require 'weather'

describe Airport do
  
  it "checks if one or more plane(s) can land on an airport when instructed" do
    plane1 = Plane.new
    subject.land(plane1, "Sunny")
    plane2 = Plane.new
    expect(subject.land(plane2, "Sunny")).to eq [plane1, plane2]
  end

  it "checks that no plane will takeoff when runway is empty" do
    plane = Plane.new
    weather = Weather.new
    expect(subject.takeoff(plane, weather)).to eq nil
  end

  it "shows that a plane after takeoff is no longer on the runway" do
    plane = Plane.new
    subject.land(plane, 'Sunny')
    expect(subject.takeoff(plane, "Sunny")).to eq []
  end

  it "checks if the weather is stormy or sunny" do
    weather = Weather.new
    expect(weather.weather_check).to eq("Sunny") || eq("Stormy")
  end

  it "Prevents a plane from takeoff if the weather is stormy" do
    plane = Plane.new
    expect(subject.takeoff(plane, "Stormy")).to eq 'No take off allowed in stormy weather'
  end

  it "Prevents a plane from landing on an airport when weather is stormy" do
    plane = Plane.new
    expect(subject.land(plane, "Stormy")).to eq 'No landing allowed in stormy weather'
  end

  it "Prevents a plane from landing on an airport when capacity of 10 is full" do
    11.times { subject.land(Plane.new, "Sunny") }
    expect(subject.land(Plane.new, "Sunny")). to eq "Airport is full"
  end
  
  it "Changes the default capacity of 10 of an airport" do
    subject.change_capacity(20)
    15.times { subject.land(Plane.new, "Sunny") }
    expect(subject.land(Plane.new, "Sunny")).to_not eq "Airport is full"
  end

end
