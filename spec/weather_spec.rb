require 'weather'

describe Weather do
  describe "#stormy?" do
    it "returns true if the weather is stormy" do
      allow(subject).to receive(:current_forecast) { :stormy }
      expect(subject.stormy?).to eq true
    end
  end
end
