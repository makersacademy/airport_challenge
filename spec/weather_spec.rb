require 'weather'

describe Weather do
  describe "#stormy?" do
    it "chooses a weather condition at random and returns a boolean" do
      expect(subject.stormy?).to be(true).or be(false)
    end

    it "returns true if the weather is stormy" do
      allow(subject).to receive(:current_forecast) { :stormy }
      expect(subject.stormy?).to eq true
    end
  end
end
