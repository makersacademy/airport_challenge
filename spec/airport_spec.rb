require "./lib/airport.rb"

describe Airport do
it "creates the new Airport class" do
  airport = Airport.new
  expect(airport).is_a?(Airport)
end
end
