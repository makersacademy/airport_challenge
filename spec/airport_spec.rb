require 'airport'

describe Airport do
  let (:plane) { double(:plane) }

  before do 
    allow(plane).to receive(:land) do |subject|
      subject.landed_planes << plane
    end
    allow(plane).to receive(:take_off) do |subject|
      subject.landed_planes.delete(plane)
    end
  end

  it "airport should have a default capacity that can be overridden as appropriate" do
    expect(subject.capacity).to eq 10 
    expect(Airport.new(20).capacity).to eq 20
  end

  it "airport stormy weather should be true when stormy? is true" do
    allow(subject).to receive(:stormy?) { true }
    expect(subject.stormy_weather).to eq true
  end

  it "checks that when a plane lands, it is in the airport" do
    subject.landed_planes = ["a plane", "another plane", "an extra plane"]
    plane.land(subject)
    expect(subject.landed_planes).to include plane
  end

  it "when a plane takes off that particular plane is no longer in the airport" do
    subject.landed_planes = ["not the right plane", plane, "not the right plane either"]
    plane.take_off(subject)
    expect(subject.landed_planes).to_not include plane
  end
end
