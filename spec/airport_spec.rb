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
    #expect{heathrow.confirm(departure)}. to output("#{plane} has taken off").to_stdout
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

  it "uses the safety_status to issue a commands 'Go' or 'Stay' " do
    heathrow = Airport.new
    current_weather = heathrow.forecast
    safety_status = heathrow.is_it_safe(current_weather)
    plane = Plane.new
    allow(heathrow.go_or_stay(safety_status, plane)).to receive("Safe") {heathrow.take_off(plane)}
    #allow(heathrow.go_or_stay(safety_status, plane)).to receive("Safe") {"#{plane} has taken off"}
    allow(heathrow.go_or_stay(safety_status, plane)).to receive("Unsafe") {"Plane not safe"}
  end

#{heathrow.store.delete(plane)}
  # it "uses the go or stay commands to prevent a plane from taking off" do
  #   heathrow = Airport.new
  #   current_weather = heathrow.forecast
  #   safety_status = heathrow.is_it_safe(current_weather)
  #   plane = Plane.new
  #   command = heathrow.go_or_stay(safety_status)
  #   allow(heathrow.red_or_green_light(command)).to receive("Go") {heathrow.store.delete(plane)}
  # end

end
# #
# allow(heathrow.take_off(plane, command)).to receive("Stay") {"Plane is not safe to take off"}
# allow(heathrow.take_off(plane, command)).to receive("Go") {heathrow.store.delete(plane)}
# allow(heathrow.take_off(plane, command)).to receive("Go") {"#{plane} has taken off"}




#allow(heathrow.red_light(command)).to eq ("Plane is not safe to take off")
#to eq (heathrow.store)
#allow(heathrow.take_off(plane, command)).to receive("Stay") {"Plane is not safe to take off"}
#allow(heathrow.green_light(plane, command)).to receive("Go") {heathrow.store.delete(plane)}

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
