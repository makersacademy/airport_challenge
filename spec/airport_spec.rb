require 'airport'

# describe Airport do
# # weather needs to be good
# # and the hanger can't be full
#   it "has a working Airport#land(plane) method" do
#     plane = Plane.new
#     expect(subject.land(plane)).to eq([plane])
#   end
#
#   it "has a working Airport#takeoff(plane) method" do
#     plane = Plane.new
#     expect(subject.takeoff(plane)).to eq(plane)
#   end
#
# end

# describe Airport do
# # weather needs to be bad
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

describe Airport do
# weather need to be good
# and hanger needs to empty
  it "has a working Airport.hanger_full? method" do
    expect(subject.hanger_full?).to eq(true)
  end
end
