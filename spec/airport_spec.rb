require 'airport'
require 'weather'

describe Airport do
  
  it "Checks if the plane lands at the airport when instructed" do
    plane = Plane.new
    expect(subject.instructions("land",plane)).to eq [plane]
  end

  it "Checks if more than one plane can land on an airport when instrcuted to land" do
    plane1 = Plane.new
    subject.instructions("land", plane1)
    plane2 = Plane.new
    expect(subject.instructions("land",plane2)).to eq [plane1, plane2]
  end
  
  it "Checks that no plane will takeoff when runway is empty" do
    plane = Plane.new
    expect(subject.instructions("takeoff",plane)).to eq nil
  end

  it "Checks that a plane takes off from the airport when instructed to take off and shows that it's no longer on the runway" do
    runway = Airport.new
    plane1 = Plane.new
    subject.instructions("land",plane1)
    plane2 = Plane.new
    subject.instructions("land",plane2)
    expect(subject.instructions("takeoff",plane2)).to eq [plane1]
  end

  it "Checks if the weather is stormy or sunny" do
    weather = Weather.new
    expect(weather.weather_check).to eq("Sunny") | eq("Stormy")
  end

end
