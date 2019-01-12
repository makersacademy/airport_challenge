require 'airport'

describe Airport do

it { is_expected.to respond_to :land }
it { is_expected.to respond_to :take_off }

it "lands at an airprot" do
  plane = Plane.new
  expect(subject.land(plane)).to eq plane
end

it "plane no loner in the airport" do
  plane = Plane.new
  expect(subject.take_off(plane)).to eq false
end
end

# test plane is an array to build an array
