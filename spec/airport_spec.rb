require 'airport'

describe Airport do

it { is_expected.to respond_to(:land).with(1).argument }
it { is_expected.to respond_to(:take_off).with(1).argument }
it { is_expected.to respond_to :weather }

describe '#land' do
it "lands at an airprot" do
  plane = Plane.new
  expect(subject.land(plane)).to eq plane
end

it "cannot land if stormy" do
  plane = Plane.new
  stormy = subject.weather
  expect{ subject.land(plane) }.to raise_error "Landing is forbidden!"
end
end

describe '#take_off' do
it "plane no loner in the airport" do
  plane = Plane.new
  expect(subject.take_off(plane)).to eq false
end

it "cannot take off when stormy" do
  plane = Plane.new
  stormy = subject.weather
  expect{ subject.take_off(plane) }.to raise_error "Take off is forbidden!"
end
end

end
