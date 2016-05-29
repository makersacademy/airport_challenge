require 'plane.rb'

describe Plane do

  it "has a default capacity" do
    expect(subject.capacity).to eq Plane::DEFAULT_CAPACITY
  end
  it "is flying when started" do
    expect(subject.flying?).to be true
  end

  it "has an unknown origin" do
    expect(subject.origin).to be_nil
  end

  it "allows to change origin" do
    subject.origin = "LHR"
    expect(subject.origin).to eq "LHR" 
  end

  it "has an unknown destination" do
    expect(subject.destination).to be_nil
  end

  it "allows us to change destination" do
    subject.destination = "MAD"
    expect(subject.destination).to eq "MAD"
  end

end
