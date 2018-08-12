require "plane"

describe Plane do
  let(:airport) { Airport.new }

  context "when first initialized" do
    it { is_expected.not_to eql(nil) }
  end

# hanger created? empty?

  describe "#land" do
    it { is_expected.to respond_to :land }

    it "takes 2 argument" do
      expect(subject).to respond_to(:land).with(2).arguments
    end

    it "adds plane to aiport hanger" do
      allow(airport).to receive(:good_weather?) { true }
      expect(subject.land(airport, airport.good_weather?)).to eq airport.hanger
      # equal airport.hanger maybe self-evident?
    end

# error when weather is bad
# error when airport is full

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
  end

# error when weather is bad

end
