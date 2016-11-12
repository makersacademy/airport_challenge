require 'plane'

describe Plane do
  it "should create a new object" do
    expect(subject).to be_a(Object)
  end
  it "should land" do
    expect(subject).to respond_to(:land)
  end
  it "should land at an airport" do
    expect(subject).to respond_to(:land).with(1).argument
  end
  it "should confirm that it has_landed" do
    expect(subject).to respond_to(:has_landed)
  end
end
