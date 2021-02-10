require 'weather'

describe Weather do
  describe ".weather_report" do
    context "generates the current weather forecast" do
      it "responds to .weather_report" do
        expect(subject).to respond_to(:weather_report)
      end

      it "generates a new weather forecast of 'stormy'" do
        allow(subject).to receive(:weather_report) { "stormy" }
        expect(subject.weather_report).to eq "stormy"
      end
    end
  end

end
