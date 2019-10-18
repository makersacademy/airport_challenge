require "airport"

describe Airport do
  airport = Airport.new
  it "is an instance of a Airport"
  expect(airport).to be_instance_of(Airport)
end
