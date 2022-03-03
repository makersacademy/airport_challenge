require_relative '../lib/weather'

describe Weather do
 
  describe "#stormy?" do
    it "weather is stormy" do
      allow_any_instance_of(Weather).to receive(:conditions).and_return("stormy")
      expect(subject.stormy?).to eq true
    end 

    it "weather is not stormy" do
      allow_any_instance_of(Weather).to receive(:conditions).and_return("sunny")
      expect(subject.stormy?).to eq false
    end
  end
end
