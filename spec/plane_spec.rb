require "plane"

describe Plane do
# mockAirport
  describe "when first initialized"
  it { is_expected.not_to eql(nil) }

  describe "#land"
  it { is_expected.to respond_to :land }

  it "takes 1 argument" do
    expect(subject).to respond_to(:land).with(1).arguments
  end
    # can we get this to one line syntax?
  it "adds plane to aiport hanger" do
    airport = Airport.new
    expect(subject.land(airport)).to eq airport.hanger
  end

  describe "#take_off"
  it { is_expected.to respond_to :take_off }
  it "takes 1 argument" do
    expect(subject).to respond_to(:take_off).with(1).arguments
  end

  it "removes plane from aiport hanger" do
    airport = Airport.new
    subject.land(airport)
    expect(subject.take_off(airport)).to eq airport.hanger
  end

    # one line syntax?

end
