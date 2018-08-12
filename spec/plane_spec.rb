require "plane"

describe Plane do
  let(:airport) { Airport.new }

  context "when first initialized" do
    it { is_expected.not_to eql(nil) }
  end

  describe "#land" do
    it { is_expected.to respond_to :land }

    it "takes 2 argument" do
      expect(subject).to respond_to(:land).with(2).arguments
    end

    it "adds plane to aiport hanger" do
      allow(airport).to receive(:good_weather?) { true }
      expect(subject.land(airport, airport.good_weather?)).to eq [subject]
    end

# subject(:sub2) {subject.land(airport, airport.good_weather?)}
    it "raises error when weather is bad" do
      allow(airport).to receive(:good_weather?) { false }
      expect{ subject.land(airport, airport.good_weather?) }.to raise_error "bad weather: can't land"

    end

    it "raises error when airport is full" do
      allow(airport).to receive(:full?) { true }
      expect{ subject.land(airport, airport.full?) }.to raise_error "hanger is full"

# want to test for specific error
    end
# check full method works.
  end

  describe "#take_off" do
    it { is_expected.to respond_to :take_off }
    it "takes 2 argument" do
      expect(subject).to respond_to(:take_off).with(2).arguments
    end

    it "removes plane from aiport hanger" do
      allow(airport).to receive(:good_weather?) { true }
      subject.land(airport, airport.good_weather?)
      expect(subject.take_off(airport, airport.good_weather?)).to eq airport.hanger
    end

    it "raises error when weather is bad" do
      subject.land(airport, airport.good_weather?)
      allow(airport).to receive(:good_weather?) { false }
      expect{ subject.take_off(airport, airport.good_weather?) }.to raise_error "bad weather: can't take-off"

    end
  end
end
