require 'plane'

describe Plane do
  let(:test_plane) { Plane.new }
  let(:test_airport) { Airport.new }

  before do
    allow(test_airport).to receive(:stormy?).and_return(false)
  end

  it "a new plane defaults to flying status: True and location: The Sky!" do
    expect(test_plane.location).to eq("The Sky!")
    expect(test_plane.flying?).to eq(true)
  end

  context "landing" do
    before do
      test_airport.request_to_land(test_plane)
    end

    it "after landing at an airport it adjusts status to 'flying: False and location: Airport'" do
      expect(test_plane.location).to eq(test_airport)
      expect(test_plane.flying?).to eq(false)
    end
  end

  context "take off" do
    before do
      test_airport.request_to_take_off(test_plane)
    end

    it "after take off, it adjusts status to 'flying: True and location: The Sky!''" do
      expect(test_plane.location).to eq("The Sky!")
      expect(test_plane.flying?).to eq(true)
    end

  end

  describe "#location" do
    context "flying" do
      it "tells me it is in the sky" do
        expect(test_plane.location).to eq("The Sky!")
      end
    end

    context "landed" do
      before do
        test_airport.request_to_land(test_plane)
      end
      it "tells me it is at an airport" do
        expect(test_plane.location).to eq(test_airport)
      end
    end
  end

  describe "#flying" do
    context "if flying" do
      it "returns true if flying" do
        expect(test_plane.flying?).to eq(true)
      end
    end

    context "if landed" do
      before do
        test_airport.request_to_land(test_plane)
      end
      it "returns false if landed" do
        expect(test_plane.flying?).to eq(false)
      end
    end
  end
end
