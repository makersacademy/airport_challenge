require "./lib/airport.rb"
require "./lib/weather.rb"

RSpec.describe Airport do
  let(:subject) { Airport.new }
  describe "#hanger" do
    it "has an empty hanger to start" do
      expect(subject.hanger).to eq []
    end
    it "has a default capacity of 10" do
      expect(subject.capacity).to eq 10
    end
  end
  describe "#take_off" do
    it "allows a plane to take off if there is one available in the hanger" do
      subject.hanger.push(:plane)
      expect(subject.take_off).to eq("in flight")
    end
    it "throws an error if it is too stormy to take off" do
      @condition = "stormy"
      @hanger = []
      subject.hanger.push(:plane)
      expect { subject.take_off }.to raise_error(RuntimeError, "Error: Can't take-off, too stormy!")
    end
    it "throws an error if there are no planes at the airport" do
      @hanger = []
      expect { subject.take_off }.to raise_error(RuntimeError, "Error: Airport Empty")
    end
  end
  describe "#land" do
    it "plane responds to landing" do
      is_expected.to respond_to(:land)
    end
    it "throws an error if there is no space at the airport" do
      plane = Plane.new
      @hanger = []
      20.times { subject.hanger << Plane.new }
      expect { subject.land(plane) }.to raise_error(RuntimeError, "Error: Airport Full")
    end
    it "throws an error if it is too stormy to land" do
    @condition = "stormy"
      expect { subject.land(:plane) }.to raise_error(RuntimeError, "Error: Can't take-off, too stormy!")
    end
  end
end
