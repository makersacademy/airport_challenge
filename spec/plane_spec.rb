require 'plane'

describe Plane do
  let(:test_plane) { Plane.new }
  let(:test_airport) { Airport.new }

  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to :take_off }

  it { is_expected.to respond_to :location }

  it "a new plane defaults to flying status: True and location: The Sky!" do
    expect(test_plane.location).to eq("The Sky!")
    expect(test_plane.flying?).to eq(true)
  end

  context "#landing" do
    before do
      test_plane.land(test_airport)
    end

    it "after landing at an airport it adjusts status to flying: False and location: Airport " do
      expect(test_plane.location).to eq(test_airport)
      expect(test_plane.flying?).to eq(false)
    end

    it "plane cannot be landed if already landed" do
      expect(test_plane.land(test_airport)).to eq "Plane has already landed at an airport: #{test_plane.location.name}"
    end
  end

  context "#take off" do
    before do
      test_plane.take_off
    end

    it "after take off, it adjusts status to to flying: True and location: The Sky!" do
      expect(test_plane.location).to eq("The Sky!")
      expect(test_plane.flying?).to eq(true)
    end

    it "plane cannot take off that is  already flying" do
      expect(test_plane.take_off).to eq "Plane is already flying."
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
        test_plane.land(test_airport)
      end
      it "tells me it is at an airport" do
        expect(test_plane.location).to eq(test_airport)
      end
    end
  end
end
