require 'plane'

describe Plane do
  it "should create a new object" do
    expect(subject).to be_a(Object)
  end
  it "should land" do
    expect(subject).to respond_to(:land)
  end
end
