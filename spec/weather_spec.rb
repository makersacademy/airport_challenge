require "weather"

describe Weather do
  
  describe "initialize" do
    it "creates a storm" do
      allow(subject).to receive(:rand) { 10 }
      subject.stormy?
      expect(subject.current_weather).to eq("stormy")
    end

    it "is sunny" do
      allow(subject).to receive(:rand) { 9 }
      subject.stormy?
      expect(subject.current_weather).to eq("sunny")
    end
  end

end
