require "plane"

describe Plane do
  let(:subject) { Plane.new }

  it "is an instance of Plane" do
    expect(subject).to be_a(Plane)
  end
  it "has a limited number of seats" do
    expect(subject.capacity).to eq(50)
  end
end
