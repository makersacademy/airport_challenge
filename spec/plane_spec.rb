require "plane"

describe Plane do
  it "Has a method to allow user to land plane at airport" do
    expect(subject).to respond_to(:land).with(1).argument
  end
end
