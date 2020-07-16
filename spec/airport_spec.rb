require 'airport'
require 'plane'

describe Airport do
  ap = Airport.new
  it "allows a plane to land at the airport" do
    ap.land("aplane")
    expect(ap.instance_variable_get(:@planes)).to include("aplane")
  end

  it { should respond_to(:land).with(1).argument }

  it "has an assignable capacity" do
    expect(ap.instance_variable_get(:@capacity)).to eql 5
  end

  it "removes referenced plane from the hangar" do
    ap.take_off("specplane")
    expect(ap.instance_variable_get(:@planes)).not_to include("specplane")
  end

  it "wont allow take off in storms" do
    ap = Airport.new(5, 3)
    expect { ap.storms }.to raise_error("No take off storms")
  end
end
