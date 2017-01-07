require 'airport'

describe Airport do

  it {is_expected.to respond_to(:landing_bay)}

  it "initializes with a landing bay that is an array" do
    expect(subject.landing_bay).to be_a Array
  end

  it "should initialize with a landing bay that is empty" do
    expect(subject.landing_bay).to be_empty
  end

  it { is_expected.to respond_to(:land_plane).with(1).argument }

  describe "#land_plane" do

    it "should put and plane in the empty landing bay and that plane should have a landed status" do
      plane = Plane.new
      airport = Airport.new
      landing_bay = airport.land_plane(plane)
      expect(landing_bay.count).to eq 1
      expect(landing_bay[0].landed_status).to eq "Landed"
    end

  end
end
