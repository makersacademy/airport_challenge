require "weather"

describe Weather do
  describe "#stormy?" do
    it "returns true if random number returns 9" do
      forecast = Weather.new
      allow(forecast).to receive(:rand).and_return(9)
      forecast.update
      expect(forecast.stormy?).to eq(true)
    end
    it 'returns false if random number returns 8' do
      forecast = Weather.new
      allow(forecast).to receive(:rand).and_return(8)
      forecast.update
      expect(forecast.stormy?).to eq(false)
    end
  end 
end
