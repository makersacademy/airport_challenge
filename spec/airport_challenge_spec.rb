require "airport_challenge"

RSpec.describe Plane do
  it "responds to land method" do
    plane = Plane.new
    plane.land(plane)
    expect(subject).to respond_to(:land)
  end

  it "responds to take_off method" do
    plane = Plane.new
    plane.take_off
    expect(subject).to respond_to(:take_off)
  end

  it "checks if plane left airport" do
    expect(subject.take_off).to eq("Plane has left the airport")
  end

end
