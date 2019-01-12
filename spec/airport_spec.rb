require 'airport'
require 'weather'

describe Airport do

it { is_expected.to respond_to(:land).with(2).argument }
it { is_expected.to respond_to(:take_off).with(2).argument }

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

 describe Weather do
   it "is stormy" do
     weather = Weather.new
     expect( weather.stormy ).to eq false
   end

   it "is not sotrmy" do
     weather = Weather.new
     expect( weather.not_stormy ).to eq true
   end
 end
