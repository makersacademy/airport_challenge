require 'traffic_controller'
require 'plane'
require 'airport'

describe TrafficController do

  it "land plane to an airport" do
    traffic_controller = TrafficController.new
    plane = Plane.new
    plane.fly
    airport = Airport.new
    weather = double(:sunny_weather, stormy?: false )

    allow(traffic_controller).to receive(:weather).and_return(weather)

    expect(traffic_controller.land_to(plane, airport)).to eq("Plane is landed"
)
  end

  it "prevent landing when weather is stormy" do
    traffic_controller = TrafficController.new
    plane = Plane.new
    airport = Airport.new
    weather = double(:stormy_weather, stormy?: true)

    allow(traffic_controller).to receive(:weather).and_return(weather)

    expect(traffic_controller.land_to(plane, airport)).to eq("It is too windy and stormy out there")
  end

  it "take off plane from an airport and confirm plane left airport" do
    traffic_controller = TrafficController.new
    plane = Plane.new
    airport = Airport.new
    airport.add_plane(plane)
    plane.assigned_airport(airport)
    weather = double(:sunny_weather, stormy?: false)

    allow(traffic_controller).to receive(:weather).and_return(weather)

    expect(traffic_controller.takeoff_from(plane,airport)).to eq('Plane has left airport')
  end

  it "prevent take off when weather stormy" do
    traffic_controller = TrafficController.new
    plane = Plane.new
    airport = Airport.new
    airport.add_plane(plane)
    plane.assigned_airport(airport)
    weather = double(:stormy_weather,  stormy?: true)

    allow(traffic_controller).to receive(:weather).and_return(weather)

    expect(traffic_controller.takeoff_from(plane, airport)).to eq('It is too windy and stormy out there')
  end

  it "prevent landing when airport is full" do
    traffic_controller = TrafficController.new
    plane = Plane.new
    plane.fly
    airport = double(:full_airport, add_plane: 'Airport is full')
    weather = double(:sunny_weather,  stormy?: false)

    allow(traffic_controller).to receive(:full?).and_return(airport)
    allow(traffic_controller).to receive(:weather).and_return(weather)

    expect(traffic_controller.land_to(plane, airport)).to eq('Airport is full')
  end

  it "prevent to take off if airport is empty" do
    traffic_controller = TrafficController.new
    airport = Airport.new
    plane = Plane.new
    plane.assigned_airport(airport)
    weather = double(:sunny_weather,  stormy?: false)

    allow(traffic_controller).to receive(:weather).and_return(weather)

    expect(traffic_controller.takeoff_from(plane, airport)).to eq('The airport is empty')
  end

  it "assign plane to airport" do
    traffic_controller = TrafficController.new
    plane = Plane.new
    airport = Airport.new

    plane.fly
    expect(traffic_controller.assign_plane_to_airport(plane, airport)).to eq(airport)
  end

  it "take off from different airport" do
    traffic_controller = TrafficController.new
    plane = Plane.new
    airport = Airport.new
    airport.add_plane(plane)

    expect(traffic_controller.takeoff_from(plane, airport)).to eq("The plane is not in this airport")
  end
end
