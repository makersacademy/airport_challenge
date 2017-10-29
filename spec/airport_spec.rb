require "airport"
require "plane"

describe Airport do
  subject(:airport) { described_class.new }

  it "if stormy, plane does NOT take off" do
    plane = Plane.new
    expect(airport.take_off(plane)).to eq "The skies are dark, best to stay on the ground"
  end

  it "If stormy, plane does NOT land" do
    plane = Plane.new
    expect(airport.land(plane)).to eq ("Got a storm front coming, cannot land here")
  end

  it "raises an error if terminal is full" do
    plane = Plane.new
    Airport.stub(:weather) do |w|
      if w == true
        Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error("Airport is full")
      end
    end
  end
end
