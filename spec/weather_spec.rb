require 'weather'

describe Weather do
  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy
  # COMPONENTS -> 1. Create a weather.rb file; 2. Create a method to generate a
  # weather weather_report 3. Randomly generate weather conditions
  describe "#weather_report" do
    context "generates the current weather report" do
      it "responds to #weather_report" do
        expect(subject).to respond_to(:weather_report)
      end

      it "generates a weather report of 'stormy' or 'sunny'" do
        allow(subject).to receive(:weather_report) { "sunny" }
        expect(subject.weather_report).to eq "sunny"
      end
    end
  end
end
