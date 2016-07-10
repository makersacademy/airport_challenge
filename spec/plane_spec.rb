require "plane"

describe Plane do
  subject(:plane) {Plane.new}
  it "has a flying status attribute" do
    expect(plane).to respond_to :flying
  end
  it "starts off flying" do
    expect(plane.flying).to eq true
  end
  it "flying status can be changed" do
    subject.flying = false
    expect(plane.flying).to eq false
  end
end
