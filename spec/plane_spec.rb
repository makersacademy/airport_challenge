require 'plane'

describe Plane do

  it "Makes sure the Plane class responds to land method" do
    plane_new = Plane.new("Plane")
    expect(plane_new).to respond_to(:land).with(1).argument
  end

  it "Makes sure the Plane class responds to take_off method" do
    plane_new = Plane.new("Plane")
    expect(plane_new).to respond_to(:take_off).with(1).argument
  end

  it "Checks that the airport and plane files are linked" do
    airport_new = Airport.new("Name")
    expect(airport_new).to respond_to(:include_plane?).with(1).argument
  end

  it "Outputs true if an airport includes a particular plane" do
    jfk = Airport.new("jfk")
    boeing = Plane.new("boeing")

    temp_weather = boeing.weather
    allow(temp_weather).to receive(:stormy?).and_return(false)

    boeing.land(jfk)
    expect(jfk.include_plane?("boeing")).to eq true
  end

  it "Expects the plane to leave the array when using method take_off" do
    jfk = Airport.new("jfk", ["boeing"])
    boeing = Plane.new("boeing")

    temp_weather = boeing.weather
    allow(temp_weather).to receive(:stormy?).and_return(false)

    boeing.take_off(jfk)

    expect(jfk.include_plane?("boeing")).to eq false
  end

  it "Leaves a message confirming the plane has taken off" do
    jfk = Airport.new("jfk", ["boeing"])
    boeing = Plane.new("boeing")

    temp_weather = boeing.weather
    allow(temp_weather).to receive(:stormy?).and_return(false)

    expect(boeing.take_off(jfk)).to eq "#{boeing.name} has taken off from #{jfk.name}"
  end

  it "prevents landing when airport is full" do
    jfk = Airport.new("jfk", ["jet", "concord", "team", "makers"])
    boeing = Plane.new("boeing")

    temp_weather = boeing.weather
    allow(temp_weather).to receive(:stormy?).and_return(false)

    expect(boeing.land(jfk)).to eq "Can't land at #{jfk.name}, airport is full"
  end

  it "prevents takeoff when weather is stormy" do
    jfk = Airport.new("jfk", ["boeing"])
    boeing = Plane.new("boeing")

    temp_weather = boeing.weather
    allow(temp_weather).to receive(:stormy?).and_return(true)

    expect { boeing.take_off(jfk) }.to raise_error "Can't take off at the moment, weather is stormy!"
  end

  it "prevents landing when weather is stormy" do
    jfk = Airport.new("jfk")
    boeing = Plane.new("boeing")

    temp_weather = boeing.weather
    allow(temp_weather).to receive(:stormy?).and_return(true)

    expect { boeing.land(jfk) }.to raise_error "Can't land at the moment, weather is stormy!"
  end

end
