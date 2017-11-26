require "plane"

describe Plane do
  subject(:plane) {described_class.new}
  it "is not flying" do
    expect(subject.flying).to eq false
  end
end
