require 'airport'

describe Airport do

it 'should store a plane once it lands' do
  airport = Airport.new(10)
  expect(airport.land("plane")).to be_instance_of Array
end

it 'should let a plane take off' do
  airport = Airport.new(10)
  expect(airport).to respond_to(:take_off).with(1).argument
end

it 'should confirm a plane is no longer in the airport' do
  airport = Airport.new(10)
  airport.land("plane")
  expect(airport.take_off("plane")).not_to include("plane")
end

it 'should tell you if an airport is full' do
  airport = Airport.new(1)
  airport.land("plane1")
  expect(airport.full?).to eq true
end

it 'should not let a plane land if an airport is full' do
  airport = Airport.new(1)
  airport.land("plane1")
  expect{airport.land("plane2")}.to raise_error("Airport full, ABORT LANDING")
 end

 it 'should not let a plane take off that is not in the hanger' do
  airport = Airport.new(2)
  plane = Plane.new
  expect{airport.take_off("plane")}.to raise_error("Plane not available to take off")
 end

it 'should not let a plane land if it has already landed' do
  airport = Airport.new
  airport.land("plane1")
  expect{airport.land("plane1")}.to raise_error("This plane has already landed")
end


it 'should check if the weather is stormy' do
  airport = Airport.new
  allow(airport).to receive(:weather_check) {"Stormy"}
  allow(airport).to receive(:weather_check) {"Fine Weather"}
  #expect(airport.weather_check).to be_instance_of String
end

end
