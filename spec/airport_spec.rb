require 'airport'
require 'weather'

describe Airport do
  
  it "checks if plane lands at the airport when instructed" do
    plane = Plane.new
    weather = Weather.new
    # expect(subject.instructions("land",plane,weather)).to eq [plane]
    expect(subject.land(plane)).to eq [plane]
  end

  it "checks if more than one plane can land on an airport when instructed" do
    plane1 = Plane.new
    weather = Weather.new
    subject.land(plane1)
    plane2 = Plane.new
    expect(subject.land(plane2)).to eq [plane1, plane2]
  end
  
  it "checks that no plane will takeoff when runway is empty" do
    plane = Plane.new
    weather = Weather.new
    expect(subject.takeoff(plane, weather)).to eq nil
  end

  # it "when a plane takes off from an airport, it shows that it's no longer on the runway" do
  #   runway = Airport.new
  #   plane1 = Plane.new
  #   weather = Weather.new
  #   subject.land(plane1)
  #   plane2 = Plane.new
  #   subject.land(plane2)
  #   expect(subject.takeoff(plane2,"Stormy")).to eq([plane1]) || eq(RuntimeError)
  # end

  it "checks if the weather is stormy or sunny" do
    weather = Weather.new
    expect(weather.weather_check).to eq("Sunny") | eq("Stormy")
  end

  it "Prevents takeoff if weather is stormy" do
    weather = Weather.new
    allow(weather).to receive(:Stormy) { "Can't take off or land due to stormy weather" }
  end

  it "when a plane takes off from an airport, it shows that it's no longer on the runway" do
    runway = Airport.new
    plane1 = Plane.new
    weather = Weather.new
    subject.land(plane1)
    plane2 = Plane.new
    subject.land(plane2)
    expect(subject.takeoff(plane2, "Stormy")).to eq 'No take off allowed in stormy weather'
  end

end

#     airport = Airport.new [plane]
#     airport.stub(:weather_rand).and_return(5)
#     expect(lambda { airport.plane_take_off(plane) }).to raise_error(RuntimeError) 
# end

  # allow(weather).to receive(:stormy) {"Can't take off or land due to stormy weather"}
