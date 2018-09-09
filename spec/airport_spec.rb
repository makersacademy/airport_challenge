require "airport"
require "./lib/plane.rb"

describe Airport do

  it "responds to land_plane" do
    expect(Airport.new).to respond_to :land_plane
  end


  it "lands a plane" do
    heathrow = Airport.new
    plane = Plane.new
    expect(heathrow.land_plane(plane)).to eq [plane]
 end

  it "instructs a plane to take off" do
    heathrow = Airport.new
    plane = Plane.new

    expect(heathrow.take_off(plane)). to eq (heathrow.store.delete(plane))

  end

  it "confirms that a plane has taken off" do
    heathrow = Airport.new
    plane = Plane.new
    departure = heathrow.take_off(plane)
    expect(heathrow.confirm(departure)). to eq("plane has taken off")
  end

  it "checks the current weather" do
    heathrow = Airport.new
    current_weather = heathrow.forecast
    expect(current_weather). to eq("Sunny").or eq("Stormy")
  end

  it "checks if the weather is safe enough to fly a plane" do
    heathrow = Airport.new
    current_weather = heathrow.forecast
    safety_status = heathrow.is_it_safe(current_weather) #why didn't it work with just current_weather?
    allow(safety_status).to receive("Sunny") {"Safe"}
    allow(safety_status).to receive("Storm") {"Unsafe"}
  end

  it "uses the safety_status to issue a commands tell a plane to takeoff or not " do
    heathrow = Airport.new
    current_weather = heathrow.forecast
    safety_status = heathrow.is_it_safe(current_weather)
    plane = Plane.new
    allow(heathrow.go_or_stay(safety_status, plane)).to receive("Safe") {heathrow.take_off(plane)}
    allow(heathrow.go_or_stay(safety_status, plane)).to receive("Unsafe") {"Takeoff not safe"}
  end


 it "uses the safety_status to issue command to tell a plane to land or not" do
   heathrow = Airport.new
   current_weather = heathrow.forecast
   safety_status = heathrow.is_it_safe(current_weather)
   plane = Plane.new
   allow(heathrow.land_or_not(safety_status, plane)).to receive("Safe") {heathrow_land_plane(plane)}
   allow(heathrow.land_or_not(safety_status, plane)).to receive("Unsafe") {"Landing not safe"}
 end


end
