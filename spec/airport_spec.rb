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

    it "should raise error if there are no flying planes" do
      plane.state = false
      expect { subject.land(plane) }.to raise_error "There are no flying planes"
    end

    it "should show if there are planes in the airport" do
      subject.land(plane)
      expect(subject.airport).to eq [plane]
    end
  end

  describe "#take_off" do
    it "should let a plane take off from an airport" do
      subject.land(plane)
      expect(subject.take_off(weather)).to eq "The plane #{plane} has left the airport"
    end

    it "raises an error what there are no planes" do
      expect { subject.take_off(weather) }.to raise_error("There are no planes available")
    end

    it "prevent take off when weather is stormy" do
      subject.land(plane)
      weather.forecast = true
      expect { subject.take_off(weather) }.to raise_error "Cannot take off when stormy"
    end
  end
end
