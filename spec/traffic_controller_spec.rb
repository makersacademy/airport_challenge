require 'traffic_controller'
require 'plane'
require 'airport'

describe TrafficController do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  it "land plane to an airport" do
    plane.fly
    weather = double(:sunny_weather, stormy?: false )

    allow(subject).to receive(:weather).and_return(weather)

    expect(subject.land_to(plane, airport)).to eq("Plane is landed")
  end

  it "prevent landing when weather is stormy" do
    weather = double(:stormy_weather, stormy?: true)

    allow(subject).to receive(:weather).and_return(weather)

    expect(subject.land_to(plane, airport)).to eq("It is too windy and stormy out there")
  end

  it "take off plane from an airport and confirm plane left airport" do
    airport.add_plane(plane)
    plane.assigned_airport(airport)
    weather = double(:sunny_weather, stormy?: false)

    allow(subject).to receive(:weather).and_return(weather)

    expect(subject.takeoff_from(plane,airport)).to eq('Plane has left airport')
  end

  it "prevent take off when weather stormy" do
    airport.add_plane(plane)
    plane.assigned_airport(airport)
    weather = double(:stormy_weather,  stormy?: true)

    allow(subject).to receive(:weather).and_return(weather)

    expect(subject.takeoff_from(plane, airport)).to eq('It is too windy and stormy out there')
  end

  it "prevent landing when airport is full" do
    plane.fly
    airport = double(:full_airport, add_plane: 'Airport is full')
    weather = double(:sunny_weather,  stormy?: false)

    allow(subject).to receive(:full?).and_return(airport)
    allow(subject).to receive(:weather).and_return(weather)

    expect(subject.land_to(plane, airport)).to eq('Airport is full')
  end

  it "prevent to take off if airport is empty" do
    plane.assigned_airport(airport)
    weather = double(:sunny_weather,  stormy?: false)

    allow(subject).to receive(:weather).and_return(weather)

    expect(subject.takeoff_from(plane, airport)).to eq('The airport is empty')
  end

  it "assign plane to airport" do
    plane.fly
    expect(subject.assign_plane_to_airport(plane, airport)).to eq(airport)
  end

  it "take off from different airport" do
    airport.add_plane(plane)

    expect(subject.takeoff_from(plane, airport)).to eq("The plane is not in this airport")
  end
end
