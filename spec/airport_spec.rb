require "airport"
require "plane"
require "weather"

describe Airport do
  subject(:airport) { described_class.new(1) }
  let(:plane) { Plane.new }

  it "can create an instance of Airport and assign to new variable" do
    expect(airport).to be_kind_of(Airport)
  end

  it "can respond to arrival" do
    expect(airport).to respond_to(:arrive).with(1).argument
  end

  it "can respond to depart" do
    expect(airport).to respond_to(:depart).with(1).argument
  end

  it "can respond to hangar" do
    expect(airport).to respond_to(:hangar)
  end

  before do
    allow(subject).to receive(:stormy?).and_return false
  end

  it "the hangar cannot take a capacity of two planes" do
    another_plane = double(:plane)
    2.times { subject.arrive(plane) }
    expect{ airport.arrive(another_plane) }.to raise_error(RuntimeError, 'The Airport is at capacity. No more planes can land.')
  end

  describe "#hangar" do
    it "hangar should have an initial inventory of no planes" do
      expect(airport.hangar).to eq([])
    end

    it "when a plane arrives in airport, a plane is added to the hangar" do
      airport.arrive(plane)
      expect(airport.hangar).to eq([plane])
    end

    it "when a plane departs the airport, a plane is removed from the hangar" do
      airport.arrive(plane)
      airport.depart(plane)
      expect(airport.hangar).to eq([])
    end

  end

end
