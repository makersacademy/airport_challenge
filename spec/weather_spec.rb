require_relative '../lib/weather'

describe Weather do
  describe "#stormy?" do
    it "weather is stormy" do
      allow(subject).to receive(:conditions).and_return("stormy")
      expect(subject.stormy?).to eq true
    end 

  
  end

end
