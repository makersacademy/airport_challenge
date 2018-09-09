require 'weather.rb'
describe Weather do
    it "generates a random weather condition" do
        w = Weather.condition
        expect(described_class::WEATHER_OUTLOOK).to include w
    end

    it "returns :clear" do
        w = Weather.new
        allow(w).to receive(:condition).and_return(:clear)
        expect(w.condition).to eq(:clear)
    end

end