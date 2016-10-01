require 'airport'
require 'plane'

describe Airport do
    subject(:airport) {described_class.new}
    let(:plane) {double :plane}

    before do
      @landed = []
    end

  describe "#land" do
    it {is_expected.to respond_to(:land).with(1).arguments}
    before do
      #plane = Plane.new
      #airport.land(plane)
    end

    it "allows the plane to land" do
      #plane = Plane.new
      #airport.land(plane)
      expect(@landed).to eq @landed << plane
    end

    it "confirms that the plane has landed" do
      #plane = Plane.new
      airport.land(plane)
      expect(airport.land(plane)).to eq "The plane has already landed"
    end

    it "raise and error when the airport is full" do
      Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
      expect{airport.land(plane)}.to raise_error "The airport is full at the moment, please wait for landing."
    end
  end

  describe "#take_off" do
    it {is_expected.to respond_to(:take_off)}

    it "confirms that the plane has taken off and it is no longer in the airport" do
      airport.take_off
      expect(airport.take_off).to eq "The plane has taken off and it is no longer in the airport"
    end

    it "allows to set a default capacity when a new instance of Airport is created" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

end
