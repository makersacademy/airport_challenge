require 'airport'
require 'weather'

describe Airport do
  
  it "checks if plane lands at the airport when instructed" do
    plane = Plane.new
    expect(subject.land(plane, "Sunny")).to eq [plane]
  end

  it "checks if more than one plane can land on an airport when instructed" do
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

  it "when a plane takes off in sunny weather, it shows that the plane is no longer on the runway" do
    plane1 = Plane.new
    subject.land(plane1, 'Sunny')
    plane2 = Plane.new
    subject.land(plane2, 'Sunny')
    expect(subject.takeoff(plane2, "Sunny")).to eq [plane1]
  end

  it "checks if the weather is stormy or sunny" do
    weather = Weather.new
    expect(weather.weather_check).to eq("Sunny") | eq("Stormy")
  end

  # it "Prevents takeoff if weather is stormy" do
  #   weather = Weather.new
  #   allow(weather).to receive(:Stormy) { "Can't take off or land due to stormy weather" }
  # end

  it "Prevents plane from takeoff if the weather is stormy" do
    plane = Plane.new
    expect(subject.takeoff(plane, "Stormy")).to eq 'No take off allowed in stormy weather'
  end

  it "checks if more than one plane can land on an airport when instructed" do
    plane = Plane.new
    expect(subject.land(plane, "Stormy")).to eq 'No landing allowed in stormy weather'
  end
  
end
