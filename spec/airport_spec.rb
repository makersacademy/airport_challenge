require 'airport'

describe Airport do
# weather needs to be good
# and the hanger can't be full
  it "has a working Airport#land(plane) method" do
    plane = Plane.new
    expect(subject.land(plane)).to eq([plane])
  end

  it "has a working Airport#takeoff(plane) method" do
    plane = Plane.new
    expect(subject.takeoff(plane)).to eq("Airborn")
  end

  it "can set Airport @hanger capacity to 0" do
    airport = Airport.new(0)
    expect(airport.land(Plane.new)).to eq("The plane can't land because the hanger is full")
  end

  it "rejects edge cases: Airborn plane trying to takeoff" do
    plane = Plane.new
    airport = Airport.new
    airport.takeoff(plane)
    expect(airport.takeoff(plane)).to eq("Cannot takeoff. Plane already airborn")
  end

  it "rejects edge cases: Grounded plane trying to land" do
    plane = Plane.new
    airport = Airport.new
    expect(airport.land(plane)).to eq("Cannot land. Plane already on the ground")
  end

end

# describe Airport do
# # weather needs to be bad
# # and the hanger can't be full
#   it "has a working Airport#bad_weather? method" do
#     expect(subject.bad_weather?).to eq(true)
#   end
#
#   it "can prevent takeoff when there is bad weather" do
#     expect(subject.takeoff(Plane.new)).to eq("The weather is too bad to fly")
#   end
#
#   it "can prevent landing when there is bad weather" do
#     expect(subject.land(Plane.new)).to eq("The weather is too bad to land")
#   end
# end

# describe Airport do
# # weather need to be good
# # and hanger needs to full
#   it "has a working Airport.hanger_full? method" do
#     expect(subject.hanger_full?).to eq(true)
#   end
#
#   it "can prevent landing when the hanger is full" do
#     expect(subject.land(Plane.new)).to eq("The plane can't land because the hanger is full")
#   end
# end
