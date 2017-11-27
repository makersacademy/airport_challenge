require 'weather'

describe Weather do
  it "returns true when 1" do
    allow(subject).to receive(:rand) {1}
    expect(subject.stormy?).to eq true
  end
  it "returns false when 2" do
    allow(subject).to receive(:rand) {2}
    expect(subject.stormy?).to eq false
  end
end
