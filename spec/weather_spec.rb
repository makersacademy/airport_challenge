require 'weather'

RSpec.describe Weather do

    describe 'can forecast' do

      it "checks forecast" do
        weather_today = Weather.new
        expect(weather_today.prediction).to be_between(1, 10)
      end

      it 'sunny today' do
        weather_today = Weather.new
        allow(weather_today).to receive(:rand).and_return(:sunny)
      end

      it 'stormy today' do
        weather_today = Weather.new
        allow(weather_today).to receive(:rand).and_return(:stormy)
      end
    end
end
