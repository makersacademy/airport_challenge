require "Weather"
RSpec.describe Weather do
  describe "#weather_conditions" do
    it "checks that weather_conditions works" do
      w = Weather.new
      expect(w.weather_conditions).to eq "sunny" || "stormy"
    end
    it "chooses the stormy weather" do
      w = Weather.new
      allow(w).to receive(:weather_conditions) { "stormy" }
      expect(w.weather_conditions).to eq "stormy"
    end
    it "chooses the sunny weather" do
      w = Weather.new
      allow(w).to receive(:weather_conditions) { "sunny" }
      expect(w.weather_conditions).to eq "sunny"
    end
  end
end
