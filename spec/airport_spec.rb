require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  describe "#land" do
    it "should land a plane at an airport if plane is flying" do
      expect(subject.land(plane)).to eq [plane]
    end
  end

    it "should raise error if there are no flying planes" do
      plane.state = false
      expect { subject.land(plane) }.to raise_error "There are no flying planes"
    end

    it "should show if there are planes in the airport" do
      subject.land(plane)
      expect(subject.airport).to eq [plane]
    end

    it "should prevent landing when capacity is full" do
      Airport::DEFAULT_CAPACITY.times{subject.land(Plane.new)}
      p subject
      expect{ subject.land(Plane.new) }.to raise_error("The airport capacity is full")
    end

  describe "#take_off" do
    it "should let a plane take off from an airport" do
      subject.land(plane)
      expect(subject.take_off).to eq "The plane #{plane} has left the airport"
    end

    it "raises an error when the airport is empty" do
      expect { subject.take_off }.to raise_error("There are no planes available")
    end
  end
end
