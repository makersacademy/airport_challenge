require "./lib/airport"

describe Airport do
  it "can land a plane at the airport" do
    aeroplane = "aeroplane"
    airport = Airport.new
    airport.land(aeroplane)
    expect(airport.landed_planes).to include(aeroplane)
  end

  it "can instruct a plane to take off a plane" do
    aeroplane = "aeroplane"
    airport = Airport.new
    airport.weather = 2
    airport.land(aeroplane)
    airport.takeoff(aeroplane)
    expect(airport.landed_planes).not_to include(aeroplane)
  end

  it "can prevent takeoff when weather is stormy " do
    aeroplane = "aeroplane"
    airport = Airport.new
    airport.land(aeroplane)
    airport.weather = 1
    expect(airport.takeoff(aeroplane)).to eq("Stormy conditions, #{aeroplane} cannot take off")
  end

  it "can prevent landing when weather is stormy" do
    aeroplane = "aeroplane"
    airport = Airport.new
    airport.weather = 1
    expect(airport.land(aeroplane)).to eq("Stormy conditions, #{aeroplane} cannot safely land")
  end

  it "can prevent landing when airport is full" do
    airport = Airport.new
    airport.weather = 2
    8.times do
      aeroplane = "aeroplane"
      airport.land(aeroplane)
    end
    aeroplane = "aeroplane"
    expect(airport.land(aeroplane)).to eq("Airport is at max capacity")
  end

  it "starts with a default capacity" do
    airport = Airport.new
    expect(airport.capacity).to eq(8)
  end

  it "can overwrite it's default capacity" do
    airport = Airport.new(20)
    expect(airport.capacity).to eq(20)
  end
end
