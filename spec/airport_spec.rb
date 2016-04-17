require "airport"

describe Airport do
  let(:landed_plane) { double(:landed_plane, landed?: true, takeoff: false) }
  let(:flying_plane) {double(:flying_plane, landed?: false, land: true) }
  subject(:airport) { described_class.new }

  context "when first created" do
    it "has no planes" do
      expect(airport.planes).to be_empty
    end
  end

  describe "planes standard behaviour" do
    it "after take-off plane no longer at airport" do
      allow(airport).to receive(:stormy?) { false }
      airport.planes << landed_plane
      airport.takeoff(landed_plane)
      expect(airport.planes).not_to include landed_plane
    end

    it "after landing plane is at airport" do
      allow(airport).to receive(:stormy?) { false }
      airport.land(flying_plane)
      expect(airport.planes).to include flying_plane
    end
  end

  describe "edge cases" do
    it "a plane cannot land if already landed" do
      #allow(airport).to receive(:stormy?) { false }
      airport.planes << landed_plane
      #expect(airport.planes.count(landed_plane)).to eq 1
      expect{ airport.land(landed_plane) }.to raise_error Airport::LANDED
    end

    it "a plane cannot take off if not at airport" do
      #allow(airport).to receive(:stormy?) { false }
      expect{ airport.takeoff(flying_plane)}.to raise_error Airport::NOT_FOUND
    end
  end

  context "when full" do
    before do
      Airport::DEFAULT_CAPACITY.times do
        airport.planes << landed_plane
      end
    end

    it "a plane can not land" do
      allow(airport).to receive(:stormy?) { false }
      expect{ airport.land(flying_plane)}.to raise_error Airport::FULL
      #expect(airport.planes.size).to eq 20
      #expect(airport.planes).not_to include flying_plane
    end
  end

  describe "capacity overrride" do
    it "changes the default capacity on initialize" do
      random_capacity = Random.rand(5000)
      subject = described_class.new random_capacity
      expect(subject.capacity).to eq random_capacity
    end
  end

  context "when stormy weather " do

    it "a plane can not take off" do
      allow(airport).to receive(:stormy?) { true }
      airport.planes << landed_plane
      #airport.takeoff(landed_plane)
      #expect(airport.planes).to include landed_plane
      expect{airport.takeoff(landed_plane)}.to raise_error Airport::STORMY
    end

    it "a plane can not land" do
      allow(airport).to receive(:stormy?) { true }
      #airport.land(flying_plane)
      #expect(airport.planes).not_to include flying_plane
      expect{airport.land(flying_plane)}.to raise_error Airport::STORMY
    end
  end
end
