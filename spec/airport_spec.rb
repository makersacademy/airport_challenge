require 'airport'
require 'plane'

describe Airport do
  ap = Airport.new

  it "allows a plane to land at the airport" do
    expect(ap.land("aplane")).to include("aplane")
  end

  it { should respond_to(:land).with(1).argument }
  end
