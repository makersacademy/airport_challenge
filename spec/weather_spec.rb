require 'weather'

describe Weather do
  describe "#stormy?" do
    it "returns true if the weather is stormy" do
      expect(subject.stormy?).to eq true
    end
  end
end
