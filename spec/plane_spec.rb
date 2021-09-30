require 'plane'

describe Plane do
  plane = Plane.new(123)
  it "knows its current airport" do
    expect(plane).to respond_to(:current_airport) # defaults to nil
  end

  it "knows if it's in flight" do
    expect(plane.in_flight?).to be(true).or be(false)
  end
end
