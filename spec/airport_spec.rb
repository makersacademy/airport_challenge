require "airport"

describe Airport do
  it "has a method to allow user to check plane has left airport" do
    expect(subject).to respond_to(:verify_takeoff).with(1).argument
  end

  it "is able to store landed planes" do
    plane = Plane.new
    subject.instance_variable_set(:@weather, :clear)
    plane.land(subject)
    expect(subject.planes.include?(plane)).to eq true
  end

  it "has a verify_takeoff which checks that a plane is not at airport" do
    plane = Plane.new
    subject.instance_variable_set(:@weather, :clear)
    expect(subject.verify_takeoff(plane)).to eq true
    plane.land(subject)
    expect(subject.verify_takeoff(plane)).to eq false
  end

  it "initializes with weather set either to :stormy or to :clear" do
    expect(subject.instance_variable_get(:@weather)).to eq(:stormy) | eq(:clear)
  end

  it "does not alter its weather state when accessed multiple times" do
    airport = Airport.new
    array_of_weather_states = []
    1000.times { array_of_weather_states << airport.instance_variable_get(:@weather) }
    expect(array_of_weather_states.uniq.length).to eq 1
  end

  it "does not give permission to fly if weather is stormy" do
    stormy_airport = Airport.new
    stormy_airport.instance_variable_set(:@weather, :stormy)
    expect(stormy_airport.permission?).to eq false
  end

  it "gives permission to land if below capacity" do
    4.times { subject.planes << :plane }
    subject.instance_variable_set(:@weather, :clear)
    expect(subject.landing_permission?).to eq true
  end

  it "does not give permission to land if at or above capacity" do
    5.times { subject.planes << :plane }
    subject.instance_variable_set(:@weather, :clear)
    expect(subject.landing_permission?).to eq false
  end

  it "allows a system designer to change the capacity of an airport" do
    subject.capacity = 50
    expect(subject.capacity).to eq 50
  end
end
