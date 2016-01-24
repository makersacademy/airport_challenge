require "airport"

describe Airport do
  let(:plane) {double(:plane)}
  let(:weather) {double(:weather, stormy?: false)}
  let(:weather_class) {double(:weather, new: weather)}
  subject { Airport.new(weather: weather_class) }

  it "returns planes in the airport" do
    expect(subject.planes).to eq []
  end

  it "sets a new capacity" do
    expect(subject.capacity(30)).to eq 30
  end

  describe "landing" do

    it "lands a plane" do
      expect(subject.land(plane)).to eq "#{plane} has landed."
    end

    it "returns an error if landing the same plane twice" do
      subject.land(plane)
      expect{subject.land(plane)}.to raise_error("Plane has already landed")
    end

    it "stores the landed plane in the airport" do
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it "raises an error if over capacity" do
      subject.capacity.times{subject.land(double(:plane))}
      expect{subject.land(plane)}.to raise_error("This airport is full!")
    end

    describe "stormy weather landing" do

      it "delays a flight if weather is stormy" do
        allow(weather).to receive(:stormy?).and_return(true)
        expect{subject.land(plane)}.to raise_error("Flight delayed due to a storm")
      end
    end
  end

  describe "take-off" do

    before(:example) do
      subject.land(plane)
    end

    it "plane takes off" do
      expect(subject.take_off(plane)).to eq "#{plane} has taken off."
    end

    it "returns an error if taking_off the same plane twice" do
      subject.take_off(plane)
      expect{subject.take_off(plane)}.to raise_error("Plane isn't in the airport")
    end

    it "removes the plane from the airport" do
      subject.take_off(plane)
      expect(subject.planes).to_not include plane
    end

    describe "stormy weather take off" do

      it "delays a flight if weather is stormy" do
        allow(weather).to receive(:stormy?).and_return(true)
        expect{subject.take_off(plane)}.to raise_error("Flight delayed due to a storm")
      end
    end
  end
end