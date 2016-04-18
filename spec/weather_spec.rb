require_relative '../lib/weather'

describe Weather do

  subject(:weather) {described_class.new}

    it "results in false if the weather is sunny" do
      allow(weather).to receive(:rand) {5}
      expect(subject.stormy?).to be false
    end

    it "returns true when weather is stormy" do
      allow(weather).to receive(:rand) {1}
      expect(subject.stormy?).to be true
    end

end
