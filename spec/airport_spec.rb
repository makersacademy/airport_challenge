require "Airport"
require "Plane"

describe Airport do


describe "#land(plane)" do
  it "allows planes to land" do
  plane = Plane.new
  expect(subject.land(plane)).to eq plane
end
it "raises and error when there is no room to land" do
  plane = Plane.new
  subject.land(plane)
  expect { subject.land(plane) }.to raise_error "No room to land"
end
end




describe "#takeoff" do
it "allows a plane to take off" do
  plane = Plane.new
  subject.land(plane)
  expect(subject.takeoff).to eq plane

end

  it "raises an error when there are no airplanes to takeoff" do
  expect { subject.takeoff }.to raise_error "No planes available"
end


end
end





# it { is_expected.to respond_to(:plane_check)}


# require "Airport.rb"
# require "Plane.rb"
#
# describe Airport do
#
#   it "allows a plane to land" do
#
#     expect(subject.land Plane).to eq("Plane landed")
#   end
#
#
#   it "allows a plane to take off, and confirms its gone" do
#   expect(subject.takeoff Plane).to eq("Plane has takenoff, no longer in the airport")
#   end
#
#   it "prevents landing when the airport is full" do
#
#
#       expect{subject.takeoff Bike.new}.to raise_error "Airport full, can't land"
# end
