require "plane"
require "airport_container"

RSpec.describe Plane do
  let (:plane) { Plane.new }

  it "responds to land method" do
    expect(subject).to respond_to(:land)
  end

  it "responds to take_off method" do
    expect(subject).to respond_to(:take_off)
  end

  it "checks if plane left airport" do
    expect(subject.planes).not_to include(plane)
  end

  it "raises error when airport is full" do
    subject.capacity.times { subject.land(plane) }
    expect { subject.land Plane.new }.to raise_error "Airport full, plane cannot land"
  end

  it "raises error on takeoff if weather is stormy" do
    expect { subject.take_off(plane) }.to raise_error "Weather is stormy, plane cannot land" if subject.weather_conditions == "stormy"
  end

  it "raises error on landing if weather is stormy" do
    expect { subject.land(plane) }.to raise_error "Weather is stormy, plane cannot land" if subject.weather_conditions == "stormy"
  end
end
