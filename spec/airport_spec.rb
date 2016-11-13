require 'airport'
require 'plane'
require 'weather'

RSpec.describe Airport do

it "the airport should be able to issue a landing request" do
  airport = Airport.new
  expect(airport).to respond_to(:landing_request)
end

it "the airport landing request should be granted if premission is granted" do
  airport = Airport.new
  expect(airport.landing_request).to eq(true)
end

it "the airport landing request should not be granted if premission is denied" do
  airport = Airport.new
  expect(airport.landing_request(false)).to eq(false)
end

it "the airport will confirm that a plane has landed" do
  airport = Airport.new
  expect(airport.landed).to eq(true)
end

it "the airport will confirm that a plane did not land" do
  airport = Airport.new
  expect(airport.landed(false)).to eq(false)
end

end
