require "airport"

describe Airport do
  let(:plane) { double :plane }

  it "is able to store landed planes" do
    subject.instance_variable_set(:@weather, :clear)
    subject.planes << plane
    expect(subject.planes.include?(plane)).to eq true
  end

  it "has a verify_takeoff method which checks that a plane is not at airport" do
    subject.instance_variable_set(:@weather, :clear)
    expect(subject.verify_takeoff(plane)).to eq true
    subject.planes << plane
    expect(subject.verify_takeoff(plane)).to eq false
  end

  it "initializes with weather set either to :stormy or to :clear" do
    expect(subject.instance_variable_get(:@weather)).to eq(:stormy) | eq(:clear)
  end

  it "does not alter its weather state when accessed multiple times" do
    airport = Airport.new
    array_of_weather_states = []
    9999.times { array_of_weather_states << airport.instance_variable_get(:@weather) }
    expect(array_of_weather_states.uniq.length).to eq 1
  end

  it "does not give permission to fly if weather is stormy" do
    stormy_airport = Airport.new
    stormy_airport.instance_variable_set(:@weather, :stormy)
    expect(stormy_airport.permission_depart?).to eq false
  end

  it "gives permission to land if below capacity" do
    4.times { subject.planes << plane }
    subject.instance_variable_set(:@weather, :clear)
    expect(subject.permission_land?).to eq true
  end

  it "does not give permission to land if at or above capacity" do
    5.times { subject.planes << plane }
    subject.instance_variable_set(:@weather, :clear)
    expect(subject.permission_land?).to eq false
  end

  it "allows a system designer to change the capacity of an airport" do
    subject.capacity = 50
    expect(subject.capacity).to eq 50
  end
end
