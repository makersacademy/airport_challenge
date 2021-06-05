require "airport"
require "plane"

describe Plane do
  let(:airport) { Airport.new }

  it "can depart from airport" do
    subject.arrive
    subject.depart
    expect(subject.departed?).to eq(true)
  end

  it "can arrive at airport" do
    subject.arrive
    expect(subject.departed?).to eq(false)
  end
end
