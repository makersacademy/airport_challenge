require "airport"
require "plane"

describe Plane do
  it "can confirm if departed" do
    expect(subject).to respond_to(:departed?).with(0).argument
    expect(subject.departed?).to eq(true)
  end
end
