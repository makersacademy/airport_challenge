require "plane"

describe Plane do
  let(:subject) { Plane.new }
  it "is an instance of Plane" do
    expect(subject).to be_a(Plane)
  end
end
