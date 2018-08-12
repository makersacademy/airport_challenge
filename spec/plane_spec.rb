require "plane"

describe Plane do
  let(:airport)         { Airport.new }
  let(:airport2)        { Airport.new }
  let(:plane_land)      { subject.land(airport, airport.good_weather?) }
  let(:plane_take_off)  { subject.take_off(airport, airport.good_weather?) }
  let(:good_weather)    { allow(airport).to receive(:good_weather?) { true } }
  let(:good_weather2)   { allow(airport2).to receive(:good_weather?) { true } }
  let(:bad_weather)     { allow(airport).to receive(:good_weather?) { false } }

  context "when first initialized" do
    it { is_expected.not_to eql(nil) }
  end
  describe "#land" do
    it { is_expected.to respond_to :land }
    it "takes 2 argument" do
      expect(subject).to respond_to(:land).with(2).arguments
    end
    it "adds plane to aiport hanger" do
      good_weather
      expect(plane_land).to eq [subject]
    end
    it "raises error when landing in a full airport" do
      good_weather
      Airport::DEFAULT_CAPACITY.times { airport.hanger << "plane" }
      expect { subject.land(airport, airport.good_weather?) }.to raise_error "hanger is full"
    end
    it "raises error when weather is bad" do
      bad_weather
      expect { plane_land }.to raise_error "bad weather: can't land"
    end
  end

  describe "#take_off" do
    it { is_expected.to respond_to :take_off }

    it "takes 2 argument" do
      expect(subject).to respond_to(:take_off).with(2).arguments
    end

    it "removes plane from aiport hanger" do
      good_weather
      plane_land
      expect(plane_take_off).to eq []
    end

    it "raises error when plane is not in hanger" do
      good_weather
      good_weather2
      plane_land
      expect { subject.take_off(airport2, airport2.good_weather?) }. to raise_error "that plane is not here"
    end

    it "raises error when landing a landed plane" do
      good_weather
      subject.land(airport, airport.good_weather?)
      expect { subject.land(airport, airport.good_weather?) }. to raise_error "plane has already landed"
    end

    it "raises error when weather is bad" do
      good_weather
      plane_land
      bad_weather
      expect { plane_take_off }.to raise_error "bad weather: can't take-off"
    end
  end
end
