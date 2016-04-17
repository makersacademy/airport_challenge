require "weather"

describe Weather do

  subject(:weather) {described_class.new}

  describe "#stormy?" do

    it "returns false when weather isnt stormy" do
      allow(weather).to receive(:stormy?) {false}
      expect(subject.stormy?).to be false
    end

    it "returns true when weather is stormy" do
      allow(weather).to receive(:rand).with(0.9) {true}
      expect(subject.stormy?).to be true
    end

  end

end
