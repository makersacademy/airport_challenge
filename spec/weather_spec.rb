require "weather"

describe Weather do
  
  describe "initialize" do
    it "decides the weather" do
      allow(subject).to receive(:current_weather) { "sunny" }
      expect(subject.current_weather).to eq("sunny")
    end
  end

end
