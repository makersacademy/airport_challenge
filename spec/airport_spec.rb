require 'airport'
require 'plane'
require 'weather'

RSpec.describe Airport do

it "the airport should be able to issue a landing request" do
  airport = Airport.new
  expect(airport).to respond_to(:landing_request)
end

it "the airport landing request should be granted if premission is granted" do
  airport = Airport.new("calm")
  expect(airport.landing_request).to eq(true)
end

it "the airport landing request should be granted if the weather is calm" do
  airport = Airport.new
  weather = Weather.new
  weather.calm #stub weather to stormy here
  expect(airport.landing_request).to eq(true)
end

it "the airport landing request should not be granted if the weather is stormy" do
  airport = Airport.new("stormy")
  expect(airport.landing_request).to eq(false)
end

it "the airport landing request should not be granted if the airport is full" do
  airport = Airport.new
  airport.capacity = 10
  10.times {airport.landed}
  expect(airport.landing_request).to eq(false)
end

it "the airport will confirm that a plane has landed" do
  airport = Airport.new
  expect(airport.landed[-1]).to be_instance_of(Plane)
end

it "the airport will confirm that a plane did not land" do
  airport = Airport.new
  expect(airport.landed(false)).to eq([])
end

it "the airport can check the weather" do
  airport = Airport.new
  expect(airport).to respond_to(:weather_report)
  expect(airport.weather_report_calm).to eq("calm") #stub weather to calm
  expect(airport.weather_report_stormy).to eq("stormy") #stub weather to stormy
end

it "the airport should be able to issue a take off request" do
  airport = Airport.new
  expect(airport).to respond_to(:take_off_request)
end

it "the airport take off request should be granted if permission is granted" do
  airport = Airport.new("calm")
  airport.landed
  expect(airport.take_off_request).to eq(true)
end

it "the airport take off request should be granted if the weather is calm" do
  airport = Airport.new
  weather = Weather.new
  weather.calm #stub weather to stormy here
  airport.landed
  expect(airport.take_off_request).to eq(true)
end

it "the airport take off request should not be granted if the weather is stormy" do
  airport = Airport.new("stormy")
  expect(airport.take_off_request).to eq(false)
end

it "the airport will confirm that a plane has taken off" do
  airport = Airport.new
  airport.landed
  expect(airport.taken_off).to eq(true)
end

it "the airport will confirm that a plane did not take off" do
  airport = Airport.new
  expect(airport.taken_off(false)).to eq(false)
end

it "the airport will have a capacity" do
  airport = Airport.new
  expect(airport.capacity).to be_instance_of(Fixnum)
end

it "When a plane lands it will be stored at the airport" do
  airport = Airport.new
  expect(airport.landed[-1]).to be_instance_of(Plane)
end

it "default airport capacity is 20" do
  airport = Airport.new
  expect(airport.capacity).to eq(20)
end

it "default airport capacity can bet set when the airport is created" do
  airport = Airport.new
expect(airport.capacity = 10).to eq(10)
end




end
