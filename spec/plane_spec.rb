require 'plane'

describe Plane do
  it "responds to #land with one argument" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "#takes_off from an airport" do
    expect(subject).to respond_to(:take_off)
  end
end
