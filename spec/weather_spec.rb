require 'weather'

describe Weather do
  it "return 'sunny' when rand is 1" do
    allow(subject).to receive(:rand) { 1 }
    expect(subject.randomiser).to eq "sunny"
  end
  it "generates random weather rand is 8" do
    allow(subject).to receive(:rand) { 8 }
    expect(subject.randomiser).to eq "stormy"
  end
end
