require './lib/airport'

describe Airport do

it { is_expected.to respond_to(:land_at_airport).with(1).argument }
it "lands at airport" do
  plane = Plane.new
  expect(subject.land_at_airport(plane)).to eq plane
end


it { is_expected.to respond_to(:plane) }
it "shows landed planes" do
  plane = Plane.new
  subject.land_at_airport(plane)
  expect(subject.plane).to eq plane
end 

it { is_expected.to respond_to(:take_off).with(1).argument }

# it "allows plane to take off" do
# plane = subject.land_at_airport(plane)
# # subject.land_at_airport(plane)
# subject.take_off(plane)
#   expect(subject.take_off(plane)).not_to include(plane)
# end

it "confirms plane is not_in_airport" do
  plane = subject.take_off(plane)
  expect(plane).to eq :not_in_airport?
 end



end
