require_relative '../lib/weather.rb'

describe Weather do
    it '#initialize' do
        weather = Weather.new
        allow(weather).to receive(:rand).and_return(2)
        expect(weather.stormy?).to eq false
    end
    
end