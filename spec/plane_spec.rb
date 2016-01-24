require 'plane'

describe Plane do

  let(:plane) { Plane.new("airport") }

  it "gets initialized with an airports object_id" do
    expect(plane.where_abouts).to eq "airport"
  end

  it "returns 'flying' after take_off" do
    dbl = double("airport")
    allow(dbl).to receive(:take_off) {"flying"}
    expect(dbl.take_off).to eq "flying"
  end

  it "returns 'flying' before landing" do
    dbl = double("airport")
    allow(dbl).to receive(:to_land_at) {"flying"}
    expect(dbl.to_land_at).to eq "flying"
  end

  describe '#to_land_at' do
    it "respond to to_land_at with 1 argument" do
      expect(plane).to respond_to(:to_land_at).with(1).argument
    end
    it "returns an error when already on the airport" do
      airport = double { "airport" }
      expect(airport).to receive(:planes)
      airport.planes
    end
  end

  describe '#take_off' do
    it "respond to take_off" do
      expect(plane).to respond_to(:take_off).with(1).argument
    end
    it "returns an eror when not on the airport" do
      airport = double { "airport" }
      expect(airport).to receive(:planes)
      airport.planes
    end
  end

end
