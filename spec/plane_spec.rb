require "plane"

describe Plane do
  it "has a flying status attribute" do
    expect(subject).to respond_to :flying
  end
  it "starts off flying" do
    expect(subject.flying).to eq true
  end
  it "flying status can be changed" do
    subject.flying = false
    expect(subject.flying).to eq false
  end
end
