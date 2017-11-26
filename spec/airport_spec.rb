require "airport"
require "weather"
require "plane"

describe Airport do
  # This allows all tests to have "sunny" weather.
  before(:each) do
    allow(subject).to receive(:stormy?).and_return(false)
  end

  describe "#land" do

    it "wont let a plane land due to bad weather" do
      a_plane = Plane.new
      allow(subject).to receive(:stormy?) { true } # same as .and_return (true)
      expect { subject.land(a_plane) }.to raise_error("Bad weather, too dangerous to land")
    end

    it "wont let a plane land as airport is full(default)" do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error("Airport full")
    end

    it "can instruct a plane to land" do
      a_plane = Plane.new
      expect(subject.land(a_plane)).to eq "The plane has landed"
    end

    it "changes the capacity of the airport to 20" do
      subject.capacity = 20
      expect(subject.capacity).to eq 5
    end

    it "wont let a plane land due to overide capacity" do
      subject.capacity = 20
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error("Airport full")
    end
  end

  describe "#take_off" do

    it "can allow a plane take off" do
      a_plane = Plane.new
      subject.land(a_plane)
      expect(subject.take_off).to eq("The plane has taken off")
    end

    it "can confirm a plane has taken off" do
      expect(subject.planes).to be_empty
    end

    it "wont allow a plane to take off due to bad weather" do
      a_plane = Plane.new
      allow(subject).to receive(:stormy?) { true }
      expect { subject.take_off(a_plane) }.to raise_error("Bad weather, all planes grounded")
    end
  end
end
