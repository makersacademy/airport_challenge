require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  let(:bigplane) { Plane.new(100) }
  let(:passenger) { double(:passenger) }

  describe "#full?" do
    it "responds to .full?" do
      expect(subject).to respond_to(:full?)
    end
    it "responds correct to .full?" do
      expect(plane.full?).to eq false
      50.times { plane.board(passenger) }
      expect(plane.full?).to eq true
    end
  end

  describe "#landed?" do
    it "responds to .landed? with true/false" do
      expect(subject).to respond_to(:landed?)
      plane.takeoff
      expect(plane.landed?).to be false
      plane.land
      expect(plane.landed?).to be true
    end
  end

  describe "#alight" do
    it "responds to alight correctly" do
      plane.board(passenger)
      expect(plane.alight).to be passenger
    end
  end

  describe "initialisation" do
    it "can take an argument at creation to set capacity" do
      expect(bigplane.capacity).to eq 100
    end
  end
end
