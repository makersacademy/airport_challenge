require 'plane'

describe Plane do
  it "should create a new object" do
    expect(subject).to be_a(Object)
  end

  it "should contain a has_landed method" do
    expect(subject).to respond_to(:has_landed)
  end
  it "should have a default value of not landed" do
    expect(subject.has_landed).to eq false
  end
  it "should return true if a plane has landed" do
    subject.has_landed = true
    expect(subject.has_landed).to eq true
  end

end
