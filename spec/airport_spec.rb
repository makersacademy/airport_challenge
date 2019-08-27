require './lib/airport'

describe Airport do

  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:land_at_airport).with(1).argument }
  it { is_expected.to respond_to(:plane) }

it "#lands_at_airport" do
  plane = Plane.new
  expect(subject.land_at_airport(plane)).to eq plane
end


it "shows landed planes" do
  plane = Plane.new
  subject.land_at_airport(plane)
  expect(subject.plane).to eq plane
end

  it  'allows planes to #take_off' do
    plane = Plane.new
    subject.land_at_airport(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it "raises exception when weather is stormy" do
    plane = Plane.new
     subject.land_at_airport(plane)
    expect  { subject.take_off(plane) }.to raise_error("Take off not permitted weather is stormy")

end
# it "allows plane to take off" do
# plane = subject.land_at_airport(plane)
# # subject.land_at_airport(plane)
# subject.take_off(plane)
#   expect(subject.take_off(plane)).not_to include(plane)
# end

# it "confirms plane is not_in_airport" do
#   plane = Plane.new
#   plane = subject.take_off(plane)
#   expect(plane).to eq :not_in_airport?
#  end



end
