require 'plane'

describe Plane do
  let(:test_plane) { Plane.new }
  let(:test_airport) { Airport.new }

  it "a new plane defaults to flying status: True and location: The Sky!" do
    expect(test_plane.status).to eq({ flying: true, location: "The Sky!"})
  end

  context "landing" do
    before do
      test_plane.land(test_airport)
    end

    it "after landing at an airport it adjusts status to flying: False and location: Airport " do
      expect(test_plane.status).to eq({ flying: false, location: test_airport })
    end

    it "plane cannot be landed if already landed" do
      expect(test_plane.land(test_airport)).to eq "Plane has already landed at an airport: #{test_plane.status[:location].name}"
    end
  end

  context "take off" do
    before do
      test_plane.take_off
    end

    it "after take off, it adjusts status to to flying: True and location: The Sky!" do
      expect(test_plane.status).to eq({ flying: true, location: "The Sky!" })
    end

    it "plane cannot take off that is  already flying" do
      expect(test_plane.take_off).to eq "Plane is already flying."
    end
  end
end
