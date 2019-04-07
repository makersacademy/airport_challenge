require 'weather'

describe Weather do
  context "generates random weather" do
    it "returns 'sunny' when rand is 1" do
      allow(subject).to receive(:rand) { 1 }
      expect(subject.randomiser).to eq "sunny"
    end
    it "returns 'stormy' when rand is 8" do
      allow(subject).to receive(:rand) { 8 }
      expect(subject.randomiser).to eq "stormy"
    end
  end
end
