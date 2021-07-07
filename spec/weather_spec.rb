require "weather"

describe Weather do
  it "returns either true or false" do
    expect(subject.stormy?).to match(boolean)
  end

  it "returns true" do
    allow(subject).to receive(:stormy?) { true }
    expect(subject).to be_stormy
  end

  it "returns false" do
    allow(subject).to receive(:stormy?) { false }
    expect(subject).to_not be_stormy
  end
end