require "plane"

describe Plane do
# oraganise so no duplication of mocks
let(:airport)   {Airport.new}

# mockAirport
  describe "when first initialized"
  it { is_expected.not_to eql(nil) }

  describe "#land"
  it { is_expected.to respond_to :land }

  it "takes 2 argument" do
    expect(subject).to respond_to(:land).with(2).arguments
  end
    # can we get this to one line syntax?
  it "adds plane to aiport hanger" do
    allow(airport).to receive(:good_weather?) { true }
    expect(subject.land(airport, airport.good_weather?)).to eq airport.hanger
  end

  describe "#take_off"
  it { is_expected.to respond_to :take_off }
  it "takes 2 argument" do
    expect(subject).to respond_to(:take_off).with(2).arguments
  end

  it "removes plane from aiport hanger" do
    allow(airport).to receive(:good_weather?) { true }
    subject.land(airport, airport.good_weather?)
    expect(subject.take_off(airport, airport.good_weather?)).to eq airport.hanger
  end

    # one line syntax?

end
