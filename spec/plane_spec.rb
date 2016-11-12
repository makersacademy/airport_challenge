require 'plane'

describe Plane do
  it "should create a new object" do
    expect(subject).to be_a(Object)
  end
  it "should land" do
    expect(subject).to respond_to(:land)
  end
  it "land shold take an airport as an argument" do
    expect(subject).to respond_to(:land).with(1).argument
  end
  it "should contain a has_landed method" do
    expect(subject).to respond_to(:has_landed)
  end
  it "should confirm if a plane has landed" do
    expect(subject.has_landed).to eq true
  end
  it "should confirm if a plane has not landed" do
    expect(subject.has_landed).to eq false
  end
end
