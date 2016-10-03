require "airport"
require "plane"
require "weather"

describe Airport do
  subject(:airport) {described_class.new(weather, 200)}
  let(:plane) {double :plane}
  let(:weather) {double :weather}

  before do
    @landed = []
  end

  describe "#land" do
    it "allows the plane to land" do
      allow(weather).to receive(:stormy?).and_return false
      expect(airport).to respond_to(:land).with(1).argument
    end


    it "stores the plane as a landed plane in the airport" do
      expect(@landed).to eq @landed << plane
    end

    it "confirms that the plane has landed" do
      allow(weather).to receive(:stormy?).and_return false
      airport.land(plane)
      expect(airport.land(plane)).to eq "The plane has already landed"
    end

    it "raise and error when the airport is full" do
      allow(weather).to receive(:stormy?).and_return false
      Airport::DEFAULT_CAPACITY.times {airport.land(plane)}
      expect{airport.land(plane)}.to raise_error "The airport is full at the moment, please wait for landing."
    end

    it "doesn't allow planes to land when the weather is stormy" do
      allow(weather).to receive(:stormy?).and_return true
      expect {airport.land(plane)}.to raise_error "Impossible to allow landing, weather is stormy!"
    end
  end

  describe "#take_off" do
    it "allows the plane to take off" do
      allow(weather).to receive(:stormy?).and_return false
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it "confirms that the plane has taken off and it is no longer in the airport" do
      allow(weather).to receive(:stormy?).and_return false
      airport.land(plane)
      expect(airport.take_off(plane)).to eq "The plane has taken off and it is no longer in the airport"
    end

    it "doesn't allow planes to take off from airports they aren't in" do
      allow(weather).to receive(:stormy?).and_return false
      airport1 = Airport.new(weather, 200)
      airport1.land(plane)
      expect {Airport.new(weather, 200).take_off(plane)}.to raise_error "Planes can't take off from airports they aren't in"
    end

    it "doesn't allow planes to take off when the weather is stormy" do
      allow(weather).to receive(:stormy?).and_return true
      expect {airport.take_off(plane)}.to raise_error "Impossible to allow take off, weather is stormy!"
    end
  end

  it "allows to set a default capacity when a new instance of Airport is created" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
end
