require 'plane'

describe Plane do

  it "should create a new instance" do
    expect(subject).to be_a Plane
  end

  it "should land at an airport" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  # it "should take off" do
  #   expect(subject).to respond_to(:take_off)
  # end
end
