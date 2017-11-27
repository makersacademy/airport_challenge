require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:plane) { double(:plane, :flying? => true, :state= => true) }
  let(:weather) { double(:weather) }
  subject(:airport) { described_class.new(weather) }

  before do
    allow(weather).to receive(:stormy?) { false }
  end

  describe "#land" do
    it "should land a plane at an airport if plane is flying" do
      expect(subject.land(plane)).to include plane
    end
  end

  it "should raise error if there are no flying planes" do
    allow(plane).to receive(:flying?) { false }
    expect { subject.land(plane) }.to raise_error "There are no flying planes"
  end

  it "should show if there are planes in the airport" do
    subject.land(plane)
    expect(subject.airport).to include plane
  end

  it "should prevent landing in stormy weather" do
    allow(weather).to receive(:stormy?) { true }
    expect { subject.land(plane) }.to raise_error "Cannot land the plane in stormy weather"
  end

  it "should prevent landing when capacity is full" do
    Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error("The airport capacity is full")
  end

  describe "#take_off" do
    it "should let a plane take off from an airport if weather is sunny" do
      subject.land(plane)
      allow(weather).to receive(:stormy?) { false }
      expect(subject.take_off).to eq "The plane #{plane} has left the airport"
    end

    it "raises an error when the airport is empty" do
      expect { subject.take_off }.to raise_error("There are no planes available")
    end

    it "prevents take off when weather is stormy" do
      subject.land(plane)
      allow(weather).to receive(:stormy?) { true }
      expect { subject.take_off }.to raise_error("The plane cannot take off as weather is stormy")
    end
  end
end
