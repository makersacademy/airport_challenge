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
  airport = Airport.new(10)
  expect(airport.full?).to eq true
end


end
