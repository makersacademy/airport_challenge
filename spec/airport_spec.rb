require 'airport'

RSpec.describe Airport do
  let(:plane) { double :plane }
  let(:weather) { double :weather}
  subject { described_class.new(weather) }

  before(:each) do
    allow(plane).to receive(:land)
    allow(plane).to receive(:take_off)
    allow(plane).to receive(:landed).and_return false
    allow(weather).to receive(:stormy?).and_return false
  end

  context "when it is clear weather" do

    it "can instruct planes to land" do
      subject.land(plane)
      expect(subject.landed_planes).to eq [plane]
    end

    it "won't land landed planes" do
      allow(plane).to receive(:landed).and_return true
      expect { subject.land(plane) }.to raise_error "Plane already landed"
    end

    it "can instruct planes to take off" do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.landed_planes).to eq []
    end

    it "can check whether it is stormy" do
      expect(subject.send(:stormy?)).to eq false
    end

    it "raises an error when a controller attempts to exceed plane capacity" do
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "Airport at capacity"
    end

    it "raises an error when a controller attempts to take off a plane not in the airport" do
      expect { subject.take_off(plane) }.to raise_error "Plane not landed at airport"
    end

    it "can land and take off a number of planes and keep track of them" do
      taken_off_plane = double(:plane, :land => nil, :take_off => nil, :landed => false)
      subject.land(plane)
      subject.land(taken_off_plane)
      subject.take_off(taken_off_plane)
      expect(subject.landed_planes).to eq [plane]
    end

  end

  context "when it is stormy" do

    it "raises an error when the controller attempts to take off a plane" do
      allow(weather).to receive(:stormy?).and_return true
      message = "Unable to take off plane due to stormy weather"
      expect { subject.take_off(plane) }.to raise_error message
    end

    it "raises an error when the controller attempts to land a plane" do
      allow(weather).to receive(:stormy?).and_return true
      message = "Unable to land plane due to stormy weather"
      expect { subject.land(plane) }.to raise_error message
    end

  end

  context "when initializing the airport" do

    it "can be passed a value for the airport capacity and weather generator" do
      expect(Airport).to respond_to(:new).with(2).argument
    end

    it "stores currently landed planes in an array" do
      expect(Weather).to respond_to(:new).with(1).argument
    end

  end

  context "the airport has private methods which are used" do

    it "can check whether the airport is full" do
      expect([true, false].include?(subject.send(:full?))).to eq true
    end

    it "can check whether a given plane is in the airport" do
      expect([true, false].include?(subject.send(:plane_at_airport?, plane))).to eq true
    end

  end

end
