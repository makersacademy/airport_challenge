require_relative "../lib/weather.rb"

describe Weather do
  describe '#stormy?' do
    it "Weather class responded to stormy?" do
      expect(subject).to respond_to(:stormy?)
    end
    it "Returns false if #rand is 0.8 (0.8 < 0.1)" do
      allow(subject).to receive(:rand).and_return(0.8) # not stormy
      expect(subject.stormy?).to eq false
    end
    it "Returns true if #rand is 0.05 (0.8 < 0.1)" do
      allow(subject).to receive(:rand).and_return(0.05) # stormy
      expect(subject.stormy?).to eq true
    end
  end
end