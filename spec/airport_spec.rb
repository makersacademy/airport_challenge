require 'airport'
require 'weather'

describe Airport do

it { is_expected.to respond_to(:land).with(2).argument }
it { is_expected.to respond_to(:take_off).with(2).argument }
#it { is_expected.to respond_to(:full?)}

describe '#land' do
it "lands at an airprot" do
  plane = Plane.new
  weather = Weather.new
  expect( subject.land(plane, weather.not_stormy) ).to eq plane
end

it "cannot land if stormy" do
  plane = Plane.new
  weather = Weather.new
  expect{ subject.land(plane, weather.stormy) }.to raise_error "Landing is forbidden!"
end

it "is full" do
  plane = Plane.new
  weather = Weather.new
  subject.capacity.times { subject.land(plane,weather.not_stormy) }
  expect{ subject.land(plane,weather) }.to raise_error "Airport is full!"
end

it 'storm blocks landing' do
  plane = Plane.new
  weather = Weather.new
  allow(weather).to receive(:outlooks).and_return true #stub
  expect { subject.land(plane,weather.outlooks) }.to raise_error "Landing is forbidden!"
end

end

describe '#take_off' do
it "plane no longer in the airport" do
  plane = Plane.new
  weather = Weather.new
  expect( subject.take_off(plane,weather.not_stormy) ).to eq false
end

it "cannot take off if stormy" do
  plane = Plane.new
  weather = Weather.new
  expect{ subject.take_off(plane,weather.stormy) }.to raise_error "Take off is forbidden!"
end
end

end
