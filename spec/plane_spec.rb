require "./lib/plane.rb"
require "./lib/airport.rb"

describe Plane do
  it "reports that is is flying" do
    plane = Plane.new
    expect(plane.flying?).to be true
  end
end
