require "plane"
require "airport_container"

RSpec.describe Plane do
  let (:plane) { Plane.new }

  it "responds to land method as instructed" do
    expect(subject).to respond_to(:land)
  end

  it "responds to take_off method as instructed" do
    expect(subject).to respond_to(:take_off)
  end

  it "checks if plane supposed to take off left the airport" do
    allow(subject).to receive(:take_off)
    expect(subject.planes).not_to include(plane)
  end

  it "raises error on landing if airport is full" do
    subject.capacity.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error "Airport full, plane cannot land"
  end

  it "raises error on takeoff if weather is stormy" do
    allow(subject).to receive(:weather_conditions) { "sunny" }
    expect { subject.take_off(plane) }.to raise_error "Weather is stormy, plane cannot land" if subject.weather_conditions == "stormy"
  end

  it "raises error on landing if weather is stormy" do
    allow(subject).to receive(:weather_conditions) { "sunny" }
    expect { subject.land(plane) }.to raise_error "Weather is stormy, plane cannot land" if subject.weather_conditions == "stormy"
  end

  it "checks that a plane that landed is at the airport" do
    expect(subject.planes).to eq(subject.land(plane))
  end

  it "checks that a plane flying is not at the airport" do
    expect(subject.flying).to be true
  end
end
