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

    expect{heathrow.take_off(plane)}. to output("#{plane} has taken off").to_stdout
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

  it "tells a plane to takeoff or not depending on weather safety" do
    heathrow = Airport.new
    current_weather = heathrow.forecast
    safety_status = heathrow.is_it_safe(current_weather)
    #expect(heathrow.go_or_stay(safety_status)). to eq("Go").or eq("Stay")
    allow(heathrow.go_or_stay(safety_status)).to receive("Safe") {"Go"}
    allow(heathrow.go_or_stay(safety_status)).to receive("Unsafe") {"Stay"}
  end

end
#
#to eq (heathrow.store)



# describe Airport do
#   describe "land_plane" do
#
#     it "initalizes a new plane" do
#       airport = Airport.new(Plane.new)
#       airport.land_plane(Plane.new)
#       plane = "Boeing737" #¨unclear on necessity
#       expect(Plane.new).to receive(:new).with("Boeing737").and_return(@plane)
#
#       expect(airport.land_plane(Plane.new)).to eq [Plane.new]
#     end
#
#   end
# end
