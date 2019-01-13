require 'weather'

RSpec.describe Weather do

    describe 'can forecast' do

      it 'sunny today' do
        weather_today = Weather.new
        allow(weather_today).to receive(:forecast).and_return(2)
      end

      it 'stormy today' do
        weather_today = Weather.new
        allow(weather_today).to receive(:forecast).and_return(9)
      end
    end
end
